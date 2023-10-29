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
        if(i>6 && i<31){
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //5
        }
        if((i>7 && i<21) || (i>26 && i<35)){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //6
        }
        if(i>8 && i<43){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true }) //7
        }
        if(i>20 && i<36){
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
        if(i>32 && i<38)
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //5
        if(i>37 && i<42){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
        }
        if(i>46 && i<51){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
        }
        if(i>51 && i<56){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
        }
        if(i>56 && i<61){
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
        }
        if(i>59 && i<64){
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
        }
        if(i<11){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
            arenaSeats.push({row:14, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
            arenaSeats.push({row:15, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
            arenaSeats.push({row:16, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true}) //6
        }
        if(i>69 && i<79){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true})
        }
        if(i>87 && i<95){
            arenaSeats.push({row:14, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true})
        }
        if(i>84 && i<92){
            arenaSeats.push({row:15, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true})
        }
        if(i>92 && i<102){
            arenaSeats.push({row:16, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true})
        }
        if(i<63){
            arenaSeats.push({row:18, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true})
        }
        if(i!=26 && i!=27 && i!= 78 && i!=79){
            arenaSeats.push({row:17, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true})
        }
    }
    for(let i=5;i<92;i++){
        if(i<7||(i>30&&i<33)){
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<8||(i>34&&i<38)){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<9||(i>42&&i<47)){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<9||(i>47&&i<52)){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<10||(i>51&&i<57)){
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<10||(i>54&&i<60)){
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<11||(i>50&&i<57)){
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i<11||(i>53&&i<60)){
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if((i>10&&i<25)||(i>55&&i<70)){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i>10&&i<87){
            arenaSeats.push({row:14, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i>10&&i<83){
            arenaSeats.push({row:15, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        if(i>10&&i<93&&i!=26&&i!=77){
            arenaSeats.push({row:16, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true})
        }
        
    }
    for(let i=9;i<55;i++){
        if(i<21||(i>35&&i<48)){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true})
        }
        if(i<35||i>38){
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true})
        }
        if(i>9&&i<55){
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true})
        }
        if(i>10&&i<51&&i!=30&&i!=31){
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true})
        }
        if(i>10&&i<54&&i!=32&&i!=33){
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true})
        }
        if(i>24&&i<56&&i!=40&&i!=41){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true})
        }
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