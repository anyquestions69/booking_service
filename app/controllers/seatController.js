const {Seat, Event} = require('../models/user')
const { Op } = require("sequelize");
function filterInput(data){
    for(let prop in data){
        console.log(prop)
    }
    // let re = /(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})/g
    // if(re.test(data))
    //     return false
}


class Manager{
   
    async getAll(req,res){
        let seats = await Seat.findAll({where:{active:true}})
        return res.send(seats)
    }
    async updatePrice(req,res){
        let {sectorId, row, col, price} = req.body
        if(!row.end){
            row.end=row.start
        }
        if(!col.end){
            col.end=col.start
        }
        let response = await Seat.update({price}, {where:{
            active:true, 
            row:{
                [Op.and]: [
                {[Op.gte]: row.start},
                {[Op.lte]: row.end},
                ]
            }, 
            col:{
                [Op.and]: [
                {[Op.gte]: col.start},
                {[Op.lte]: col.end},
                ]
            }, 
            sectorId
        }})
        return res.send(response)
    }
    async bookOne(req,res){
        let {row,col,sectorId, email} = req.body
        //filterInput(req.body) soon
        let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g
        if(!re.test(email))
            return res.status(400).send({error:'Неверно указан email'})
        let seat = await Seat.findOne({where:{active:true, row, col, sectorId}})
        if(!seat)
            return res.status(400).send({error:'Место указано не верно'})
        if(seat.statusId==3){
            return res.status(400).send({error:'Место уже занято'})
        }
        let response = await Seat.update({statusId:3, email },{where:{active:true, row, col, sectorId}})
        return res.send({res:"Место успешно забронировано"})
    }
    
    async requestBooking(req,res){
        let {email, row,col, sectorId}= req.body
        if(!re.test(email))
            return res.status(400).send({error:'Неверно указан email'})
       
        let seat = await Seat.findOne({where:{active:true, row, col, sectorId}})
        if(!seat)
            return res.status(400).send({error:'Место указано не верно'})
        if(seat.statusId==3){
            return res.status(400).send({error:'Место уже занято'})
        }
        let response = await Seat.update({statusId:2, email },{where:{active:true, row, col, sectorId}})
        return res.send({res:"Ожидайте рассмотрения заявки менеджером"})
    }
    
}


let manager = new Manager()
module.exports = manager