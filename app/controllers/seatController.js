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
    async showRequests(req,res){
        let seats = await Seat.findAll({where:{active:true, statusId:2}})
        return res.send(seats)
    }
    async updatePrice(req,res){
        try{
            let {sectorId, row, col, price} = req.body

            if(!row.end){
                row.end=row.start
            }
            if(!col.end){
                col.end=col.start
            }
            
            price = parseFloat(price)
            let response = await Seat.update({price}, {where:{
                active:true, 
                row:{
                    [Op.and]: [
                    {[Op.gte]: parseInt(row.start)},
                    {[Op.lte]: parseInt(row.end)},
                    ]
                }, 
                col:{
                    [Op.and]: [
                    {[Op.gte]: parseInt(col.start)},
                    {[Op.lte]: parseInt(col.end)},
                    ]
                }, 
                sectorId:parseInt(sectorId)
            }})
            return res.send(response)
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
        
    }
    async bookOne(req,res){
        try{
            let {id} = req.body
            //filterInput(req.body) soon
        console.log(req.body)
            let seat = await Seat.findOne({where:{id}})
            console.log(seat)
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            if(seat.statusId==3){
                return res.status(400).send({error:'Место уже занято'})
            }
            let response = await Seat.update({statusId:3, email:seat.email },{where:{id}})
            return res.send({res:"Место успешно забронировано"})
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    
    async requestBooking(req,res){
        try{
            let {email, row,col, sectorId}= req.body
            let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g
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
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    
}


let manager = new Manager()
module.exports = manager