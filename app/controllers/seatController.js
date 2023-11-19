const {Seat, Event} = require('../models/user')
const { Op } = require("sequelize");
const { createTransport } = require('nodemailer');
const QRCode = require('qrcode');
const PDFDocument = require('pdfkit');
const fs=require('fs')
const transporter = createTransport({
    host: process.env.SMTP_SERVER,
    port:587,
    auth: {
     
      user: process.env.SMTP_MAIL,
      pass: process.env.SMTP_PASSWORD
    },
  });



class Manager{
    async getPlace(req,res){
        try{
            let uuid=req.params.uuid
            let seat= await Seat.findOne({where:{uuid}})
            if(!seat){
                return res.status(404).send({error:'Билет не найден'})
            }
            return res.send(seat)
        }catch(e){
            return res.status(404).send({error:'Билет не найден'})
        }
       
    }
   
    async getAll(req,res){
        let seats = await Seat.findAll({where:{active:true}})
        return res.send(seats)
    }
    async showRequests(req,res){
        let seats = await Seat.findAll({where:{active:true, statusId:2}})
        return res.send(seats)
    }
    async showBooked(req,res){
        let seats = await Seat.findAll({where:{active:true, statusId:3}})
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
            let seat = await Seat.findOne({where:{id}})
            let row=-6
            console.log(seat)
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            if(seat.statusId==3){
                return res.status(400).send({error:'Место уже занято'})
            }
            let response = await Seat.update({statusId:3, email:seat.email },{where:{id}})
            let sector = ''
            switch (seat.sectorId) {
              case 1:
                sector =  'Bronze'
                break;
              case 2:
                sector =  'Platinum'
                break;
              case 3:
              sector =  'Gold'
                break;
              case 4:
              sector =  'Silver'
                break;
              default:
                break;
            }
            row+=seat.row
            if(row<=0){
                row+=6
            }
            let event = await Event.findOne({order: [ [ 'createdAt', 'DESC' ]],})
            let date = new Date(event.date)
            var datestring = date.getDate()  + "." + (date.getMonth()+1) + "." + date.getFullYear()
            const directory = __dirname+'/../tickets';
            let qr= await QRCode.toDataURL(process.env.DOMAIN+'/check/'+seat.uuid)
                let doc = new PDFDocument({size: 'A4'});
                doc.pipe(fs.createWriteStream(directory+'/'+seat.uuid+'.pdf')); 
                doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
                doc.image(qr, 420,85,{ height:75, width:75,
                })
                .fontSize(15) 
                    .text(sector,254,41) //264, 63)
                    .text(seat.email,264, 63)
                    .text(row, 185, 85)
                    .text(seat.col, 332, 85)
                    .text(seat.price, 190, 113)
                    .text(datestring, 327, 146)
                    .fontSize(10)
                    .save()
                    .rotate(270, {origin: [90, 140]})
                    .text(row, 80,137)
                    .text(seat.col, 140,137)
                    .text(seat.price, 194,137)
                    .text(sector, 130, 147)
                    .restore()
                doc.end()
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `Бронь места`,
                attachments: [
                    {   // file on disk as an attachment
                        filename: 'ticket.pdf',
                        path: __dirname+'/../tickets/'+seat.uuid+'.pdf' // stream this file
                    }],
                text: `<h4>Ваше место успешно забронировано!</h4>
                        <p>Сектор: ${sector} Место: ${seat.col} Ряд: ${row}</p>`
            };
            
            transporter.sendMail(mailOptions, function(error, info){
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
            return res.send({res:"Место успешно забронировано"})
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    async declineBooking(req, res){
        try{
            let {id} = req.body
            //filterInput(req.body) soon
        console.log(req.body)
            let seat = await Seat.findOne({where:{id}})
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            let response = await Seat.update({statusId:1, email:seat.email },{where:{id}})
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `Бронь места отменена`,
                text: `<h4>Ваш запрос был отклонён менеджером</h4>
                       `
            };
            
            transporter.sendMail(mailOptions, function(error, info){
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
            return res.send({res:"Бронь отменена"})
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    
    async requestBooking(req,res){
        try{
            console.log(req.body)
            let ticket= req.body
            let email=ticket.email
            let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g
            let text = ``
            let row=-6
            if(!re.test(email))
                return res.status(400).send({error:'Неверно указан email'})
            let seat = await Seat.findOne({where:{active:true, row:ticket.row, col:ticket.col, sectorId:ticket.sectorId}})
            if(!seat)
                return res.status(404).send({error:'Неверно указано место'})
            if(seat.statusId!=1)
                return res.status(404).send({error:'Место уже забронировано'})
            let response = await Seat.update({statusId:2, email },{where:{active:true, row:ticket.row, col:ticket.col, sectorId:ticket.sectorId}})
            switch (ticket.sectorId) {
            case 1:
                ticket.sector =  'Bronze'
                break;
            case 2:
                ticket.sector =  'Platinum'
                break;
            case 3:
                ticket.sector =  'Gold'
                break;
            case 4:
                ticket.sector =  'Silver'
                break;
            default:
                break;
            }
            row+=seat.row
            if(row<=0){
                row+=6
            }
            text+=`<p>Сектор: ${ticket.sector} Место: ${ticket.col} Ряд: ${row}</p>`
            
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: process.env.ADMIN_EMAIL,//process.env.ADMIN_EMAIL,
                subject: `Новая заявка на бронирование`,
                text: text+`<p>email: ${email}</p>`
            };
            
            transporter.sendMail(mailOptions, function(error, info){
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
            return res.send({res:"Ожидайте рассмотрения заявки менеджером"})
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    
}


let manager = new Manager()
module.exports = manager