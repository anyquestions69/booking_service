const {Event, Seat} = require('../models/user')
const Sequelize = require('sequelize')
   

const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: rows } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems.length / limit);
  
    return { totalItems:totalItems.length, rows, totalPages, currentPage };
  };
function createSeats(body, eventId){
    let {arena} = body
    let arenaSeats=[]
    for(let j=1;j<3;j++){
        for(let i=1;i<19;i++){
            arenaSeats.push({row:j, col:i, statusId:1, sectorId:1, price:arena, eventId}) //первые 2 ряда
        }
    }
    for(let i=1;i<15;i++){
        arenaSeats.push({row:3, col:i, statusId:1, sectorId:1, price:arena, eventId}) //3
    }
    for(let i=1;i<11;i++){
        arenaSeats.push({row:4, col:i, statusId:1, sectorId:1, price:arena, eventId}) //4
    }
    for(let i=1;i<37;i++){
        switch (i) {
            case i<7:
                arenaSeats.push({row:5, col:i, statusId:1, sectorId:2, price:arena, eventId}) //5-a1
                break;
            case i<14:
                arenaSeats.push({row:5, col:i, statusId:1, sectorId:3, price:arena, eventId}) //5-a2
                break;
            case i<24:
                arenaSeats.push({row:5, col:i, statusId:1, sectorId:4, price:arena, eventId}) //5-a3
                break;  
            case i<31:
                arenaSeats.push({row:5, col:i, statusId:1, sectorId:5, price:arena, eventId}) //5-a4
                break;
            default:
                arenaSeats.push({row:5, col:i, statusId:1, sectorId:6, price:arena, eventId}) //5-a5
                break;
        }    
    }
    for(let i=1;i<42;i++){
        switch (i) {
            case i<8:
                arenaSeats.push({row:6, col:i, statusId:1, sectorId:2, price:arena, eventId}) //6-a1
                break;
            case i<16:
                arenaSeats.push({row:6, col:i, statusId:1, sectorId:3, price:arena, eventId}) //6-a2
                break;
            case i<27:
                arenaSeats.push({row:6, col:i, statusId:1, sectorId:4, price:arena, eventId}) //6-a3
                break;  
            case i<35:
                arenaSeats.push({row:6, col:i, statusId:1, sectorId:5, price:arena, eventId}) //6-a4
                break;
            default:
                arenaSeats.push({row:6, col:i, statusId:1, sectorId:6, price:arena, eventId}) //6-a5
                break;
        }    
    }

    console.log(arenaSeats)
    return arenaSeats
   
}

class Manager{
   
    async getAll(req,res){
        let page = req.query.page||1
        var limit =5
        let events = await Event.findAndCountAll({
            subQuery: false,
            attributes: { 
                include: [[Sequelize.fn("COUNT", Sequelize.where(Sequelize.col('seats.statusId'),2)), "seatsCount"]] 
            },
            include: [{
                model:Seat,
                where:{
                    statusId:1
                },
               attributes:[]
            }],
            group: ['event.id'],
            offset: page>=1?((page-1)*2):0,
            limit: limit
        })
        return res.send(getPagingData(events,page, 10))
        
       
    }
    async getOne(req,res){
       let {eventId} = req.params
      
        let event = await Event.findOne({
            where: {
                id:eventId
              },
              subQuery: false,
              attributes: { 
                  include: [[Sequelize.fn("COUNT", Sequelize.col("seats.id")), "seatsCount"]] 
              },
              include: [{
                  model:Seat,
                 attributes:[]
              }],
              group: ['event.id']
        })
        return res.send(event)
    }
    async addOne(req,res){
        let event = await Event.create({name:req.body.name, date:req.body.date})
        let seats  = createSeats(req.body, event.id)
        let result = await Seat.bulkCreate(seats, { validate: true })
        return res.send(event)
    }
    async deleteOne(req,res){
        let {eventId}= req.params
        let event = await Event.destroy({id:eventId})
        return res.send({msg:'Успешно удалено'})
    }
    
}
let manager = new Manager()
module.exports = manager