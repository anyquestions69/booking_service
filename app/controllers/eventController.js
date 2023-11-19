const {Event, Seat} = require('../models/user')
const Sequelize = require('sequelize')
const QRCode = require('qrcode');
const { v4: uuid } = require('uuid');
const PDFDocument = require('pdfkit');
const fs=require('fs')
const bwipjs = require('bwip-js');



const getPagingData = (data, page, limit) => {
    const { count: totalItems, rows: rows } = data;
    const currentPage = page ? +page : 0;
    const totalPages = Math.ceil(totalItems.length / limit);
  
    return { totalItems:totalItems.length, rows, totalPages, currentPage };
  };

async function createTickets(){
    let event = await Event.findOne({order: [ [ 'createdAt', 'DESC' ]],})
    let date = new Date(event.date)
    var datestring = date.getDate()  + "." + (date.getMonth()+1) + "." + date.getFullYear()
    const directory = __dirname+'/../tickets';
    let qr =''
    fs.readdir(directory, async (err, files) => {
        if (err) throw err;

        for (const file of files) {
            if (file !== '.gitkeep'){
                fs.unlink(directory+'/'+ file, async (err) => {
                if (err) throw err;
                });
            }
        }
        let seats = await Seat.findAll({where:{active:true}})
        for(let seat of seats ){
            let sector=''
            switch (seat.sectorId) {
                case 1:
                    sector='Bronze'
                    break;
                case 2:
                    sector='Platinum'
                    break;
                case 3:
                    sector='Gold'
                    break;
                case 4:
                    sector='Silver'
                    break;
                default:
                    break;
                }
              
                
                if (err) throw err;
                
                let bc = await bwipjs.toBuffer({
                    bcid:        'code128',       // Barcode type
                    text:        seat.uuid,    // Text to encode
                })
                    let doc = new PDFDocument({size: 'A4'});
                    doc.pipe(fs.createWriteStream(directory+'/'+seat.uuid+'.pdf')); 
                    doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
                   
                    doc.image('data:image/png;base64,'+bc.toString('base64'), 420,85,{ height:20})
                    .fontSize(15) 
                        .text(sector,254,31) //264, 63)
                        .text(seat.row, 185, 85)
                        .text(seat.col, 332, 85)
                        .text(seat.price, 190, 113)
                        .text(datestring, 327, 146)
                        .fontSize(10)
                        .save()
                        .rotate(270, {origin: [90, 140]})
                        .text(seat.row, 80,137)
                        .text(seat.col, 140,137)
                        .text(seat.price, 194,137)
                        .text(sector, 130, 151)
                        .restore() 
                    doc.end()
               
               
            
        }
        
    })
   
}
async function createSeats(body, eventId){
    let {bronze, silver, gold, platinum} = body
    let arenaSeats=[]
    let id=''
    let qr=''
    for(let i=1;i<43;i++){//silver
        if(i<19){
            id=uuid()
            arenaSeats.push({row:1, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true, uuid:id }) //1
            
        if(i<5 || i>8){
            arenaSeats.push({row:2, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true , uuid:uuid()}) //2
        }
        }
        if(i<15){
            arenaSeats.push({row:3, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true, uuid:uuid() }) //3
        }
        if(i<11){
            arenaSeats.push({row:4, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true , uuid:uuid()}) //4
        }
        if(i>6 && i<31){
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true , uuid:uuid()}) //5
        }
        if((i>7 && i<21) || (i>26 && i<35)){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true, uuid:uuid() }) //6
        }
        if(i>8 && i<43){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true, uuid:uuid() }) //7
        }
        if(i>20 && i<36){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:2, price:silver, eventId,active:true, uuid:uuid() }) //8
        }
    }
    for(let i=1;i<104;i++){//bronze
        if(i<5){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //5
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //7
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //8
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //9
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //10
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //11
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //12
        }
        if(i>32 && i<37)
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //5
        if(i>37 && i<42){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
        }
        if(i>46 && i<51){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
        }
        if(i>51 && i<56){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
        }
        if(i>56 && i<61){
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
        }
        if(i>59 && i<64){
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
        }
        if(i<11){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
            arenaSeats.push({row:14, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
            arenaSeats.push({row:15, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
            arenaSeats.push({row:16, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()}) //6
        }
        if(i>69 && i<79){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()})
        }
        if(i>86 && i<96){
            arenaSeats.push({row:14, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()})
        }
        if(i>82 && i<92){
            arenaSeats.push({row:15, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()})
        }
        if(i>92 && i<102){
            arenaSeats.push({row:16, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()})
        }
        if(i<64){
            arenaSeats.push({row:18, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()})
        }
        if(i!=26 && i!=27 && i!= 78 && i!=79){
            arenaSeats.push({row:17, col:i, statusId:1, sectorId:1, price:bronze, eventId,active:true, uuid:uuid()})
        }
    }
    for(let i=5;i<93;i++){
        if(i<7||(i>30&&i<33)){
            arenaSeats.push({row:5, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<8||(i>34&&i<38)){
            arenaSeats.push({row:6, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<9||(i>42&&i<47)){
            arenaSeats.push({row:7, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<9||(i>47&&i<52)){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<10||(i>51&&i<57)){
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<10||(i>54&&i<60)){
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<11||(i>50&&i<57)){
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i<11||(i>53&&i<60)){
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if((i>10&&i<25)||(i>55&&i<70)){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i>10&&i<87){
            arenaSeats.push({row:14, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i>10&&i<83){
            arenaSeats.push({row:15, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        if(i>10&&i<93&&i!=26&&i!=77){
            arenaSeats.push({row:16, col:i, statusId:1, sectorId:4, price:platinum, eventId,active:true, uuid:uuid()})
        }
        
    }
    for(let i=9;i<56;i++){
        if(i<21||(i>35&&i<48)){
            arenaSeats.push({row:8, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true, uuid:uuid()})
        }
        if(i<35||i>38){
            arenaSeats.push({row:9, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true, uuid:uuid()})
        }
        if(i>9&&i<55){
            arenaSeats.push({row:10, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true, uuid:uuid()})
        }
        if(i>10&&i<51&&i!=30&&i!=31){
            arenaSeats.push({row:11, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true, uuid:uuid()})
        }
        if(i>10&&i<54&&i!=32&&i!=33){
            arenaSeats.push({row:12, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true, uuid:uuid()})
        }
        if(i>24&&i<56&&i!=40&&i!=41){
            arenaSeats.push({row:13, col:i, statusId:1, sectorId:3, price:gold, eventId,active:true, uuid:uuid()})
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
       
        let seats  = await createSeats(req.body, event.id)
        let result = await Seat.bulkCreate(seats, { validate: true })
       createTickets()
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