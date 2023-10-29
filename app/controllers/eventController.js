const {Event, Seat} = require('../models/user')
const Sequelize = require('sequelize')
   

const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: rows } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems.length / limit);
  
    return { totalItems:totalItems.length, rows, totalPages, currentPage };
  };
function createSeats(body, eventId){
    let {bronze, silver, gold, platinum} = body
    let arenaSeats=[]
    
    for(let i=1;i<43;i++){//silver
        if(i<19){
        arenaSeats.push({row:1, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //1
        if(i<5 || i>8){
            arenaSeats.push({row:2, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //2
        }
        }
        if(i<15){
            arenaSeats.push({row:3, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //3
        }
        if(i<11){
            arenaSeats.push({row:4, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //4
        }
        if(i>6 || 31){
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //5
        }
        if(i>7 ||i<21 || i>26 || i<35){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //6
        }
        if(i>8 || i<43){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //7
        }
        if(i>20 || i<36){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //8
        }
    }
    for(let i=1;i<104;i++){//bronze
        if(i<5){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //5
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //7
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //8
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //9
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //10
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //11
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //12
        }
        if(i>32 || i<38)
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //8
       
    }
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
        await Seat.update({active:false},{where:{active:true}})
        console.log(event.id)
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