const {Seat} = require('../models/user')
const { Op } = require("sequelize");
const Sequelize = require('sequelize')

   

const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: groups } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems / limit);
  
    return { totalItems, groups, totalPages, currentPage };
  };
  

class Manager{
   
    async getOne(req,res){
        let act = await Seat.findOne({where:{row:req.params['id'], col: req.params['id']}})
        return res.send(act)
    }
    async getAll(req,res){
        let act = await Seat.findAll({where:{id:req.params['id']}})
        return res.send(act)
    }
   
    
    
}
let manager = new Manager()
module.exports = manager