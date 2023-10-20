const {Seat, Event} = require('../models/user')

function filterInput(data){
    for(let prop in data){
        console.log(prop)
    }
    // let re = /(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})/g
    // if(re.test(data))
    //     return false
}


class Manager{
   
    async getOne(req,res){
        let {eventId}= req.params
        let {row,col} = req.body
        let seat = await Seat.findOne({where:{eventId, row, col}})
        return res.send(seat)
    }
    async getAll(req,res){
        let {eventId}= req.params
        let seats = await Seat.findAll({where:{eventId}})
        return res.send(seats)
    }
    async bookOne(req,res){
        let {row,col,email} = req.body
        let {eventId}= req.params
        //filterInput(req.body) soon
        let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g
        if(!re.test(email))
            return res.status(400).send({error:'Неверно указан email'})
        let event  = await Event.findByPk(eventId)
        if(!event)
            return res.status(400).send({error:'Неверно указано событие'})
        let seat = await Seat.findOne({where:{eventId, row, col}})
        if(seat)
            return res.status(400).send({error:'Место уже занято'})

        let response = await Seat.create({eventId, row, col, email })
        return res.send(response)
    }
    
    
}


let manager = new Manager()
module.exports = manager