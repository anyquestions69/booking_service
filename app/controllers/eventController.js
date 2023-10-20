const {Event, Seat} = require('../models/user')
const Sequelize = require('sequelize')
   

const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: rows } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems.length / limit);
  
    return { totalItems:totalItems.length, rows, totalPages, currentPage };
  };
  

class Manager{
   
    async getAll(req,res){
        let page = req.query.page||1
        var limit =5
        let events = await Event.findAndCountAll({
            subQuery: false,
            attributes: { 
                include: [[Sequelize.fn("COUNT", Sequelize.col("seats.id")), "seatsCount"]] 
            },
            include: [{
                model:Seat,
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