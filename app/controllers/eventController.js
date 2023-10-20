const {Event} = require('../models/user')

   

const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: rows } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems / limit);
  
    return { totalItems, rows, totalPages, currentPage };
  };
  

class Manager{
   
    async getAll(req,res){
        let page = req.query.page||1
        var limit =5
        let events = await Event.findAndCountAll({offset: page>=1?((page-1)*2):0, limit: limit})
        return res.send(getPagingData(events,page, 10))
    }
    async addOne(req,res){
        let event = await Event.create({name:req.body.name, date:req.body.date})
        return res.send(event)
    }
    
    
}
let manager = new Manager()
module.exports = manager