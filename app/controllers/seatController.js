const {Seat, Event, Balcon} = require('../models/user')
const { Op } = require("sequelize");
const { createTransport } = require('nodemailer');
const PDFDocument = require('pdfkit');
const fs=require('fs')
const bwipjs = require('bwip-js');
const path = require("path")

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
    async getBalcon(req,res){
        let seats = await Balcon.findAll({where:{active:true}})
        return res.send(seats)
    }
    async getAllWithFilters(req,res){
        let {segment, row, order, sectorId} = req.query
        let rowQuery
        let orderQuery
        let balcon
        let seats
        if(!sectorId){
            sectorId=[1,2,3,4]
        }
        if(!Array.isArray(sectorId)){
            sectorId=[sectorId]
        }
        if(segment==2){
            if(row){
                row+=6
                rowQuery=row
            }else{
                rowQuery={[Op.gt]: 6}
            }
        }else if(segment==1){
            if(row){
                rowQuery=row
            }else{
                rowQuery={[Op.lte]: 6}
            }
        }else {
            if(row){
                rowQuery={[Op.or]: [parseInt(row),parseInt(row)+6]}
            }else{
                rowQuery={[Op.gte]: 0}
            }
        }
        if(order==2){
            orderQuery=[['row', 'DESC']]
        }else{
            orderQuery=[['row', 'ASC']]
        }

        if(segment==3){
           
           
            if(sectorId.length>1){
                balcon = await Balcon.findAll({where:{
                    active:true,
                    row:rowQuery,
                    sectorId: {
                        [Op.or]: sectorId
                    }
                }, order: orderQuery
                })
            }else{
                balcon= await Balcon.findAll({where:{
                    active:true,
                    row:rowQuery,
                    sectorId: sectorId[0]
                }, order: orderQuery
                })
            }
           
            return res.send(balcon)
        }else {
            if(segment==2){
                if(sectorId.length>1){
                    seats = await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: {
                            [Op.or]: sectorId
                            }
                    }, order: orderQuery
                    })
                }else{
                        seats= await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0]
                    }, order: orderQuery
                    })
                }
               
                return res.send(seats)
            }else if(segment==1){
               
                if(sectorId.length>1){
                    seats = await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: {
                            [Op.or]: sectorId
                            }
                    }, order: orderQuery
                    })
                }else{
                        seats= await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0]
                    }, order: orderQuery
                    })
                }
               
                return res.send(seats)
            }else{ 
                
                if(sectorId.length>1){
                    seats = await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: {
                            [Op.or]: sectorId
                            }
                    }, order: orderQuery
                    })
                }else{
                        seats= await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0]
                    }, order: orderQuery
                    })
                }
                if(sectorId.length>1){
                    balcon = await Balcon.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: {
                            [Op.or]: sectorId
                        }
                    }, order: orderQuery
                    })
                }else{
                    balcon= await Balcon.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0]
                    }, order: orderQuery
                    })
                }
                for(let b of balcon){
                    seats.push(b)
                }
                return res.send(seats)
            }
           
            
        }
    }
    async showRequests(req,res){
        let seats = await Seat.findAll({where:{active:true, statusId:2}})
        let balcon = await Balcon.findAll({where:{active:true, statusId:2}})
        for(let balc of balcon){
            seats.push(balc)
        }
        return res.send(seats)
    }
    async showBooked(req,res){
        let seats = await Seat.findAll({where:{active:true, statusId:3}})
        let balcon = await Balcon.findAll({where:{active:true, statusId:3}})
        for(let balc of balcon){
            seats.push(balc)
        }
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
    async getList(req,res){
        let csv=''
        let activeSeat = await Seat.findOne({where:{active:true}})
        let event = await Event.findOne({where: {id:activeSeat.eventId}})
        let date = new Date(event.date)
        var filename = date.getFullYear()+('0' +(date.getMonth()+1)).slice(-2)+('0' + date.getDate()).slice(-2) +event.name
        let seats = await Seat.findAll({where:{active:true}})
        
        for(let seat of seats ){
            let row=-6
            let segment =''
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
                row+=seat.row
            if(row<=0){
                row+=6
                segment='Арена'
            }else{
                segment='Партер'
            }
            csv+=seat.uuid+','+segment+','+sector+','+row+','+seat.col+','+seat.price+'\n';
        }
        let file = path.join(__dirname,`../tables/${filename}.csv`)
        fs.writeFile(file,csv,()=>{
            res.set('Content-Disposition',`attachment; filename="${filename}.csv"`).sendFile(file)
            setTimeout(()=>{fs.unlink(file, async (err) => {
                if (err) throw err;
                })}, 
                20000)
            
        })
       
    }
    async bookOne(req,res){
        try{
            let bc
            let {id} = req.body
            //filterInput(req.body) soon
            let place=1
            let seat = await Seat.findOne({where:{id, active:true,statusId:2}})
            
            let row=-6
            console.log(seat)
            if(!seat){
                seat = await Balcon.findOne({where:{id, active:true,statusId:2}})
                place=2
            }
               
            
            if(seat.statusId==3){
                return res.status(400).send({error:'Место уже занято'})
            }
            let response 
            if(place==1){
                response= await Seat.update({statusId:3, email:seat.email },{where:{id}})
            }else{
                response= await Seat.update({statusId:3, email:seat.email },{where:{id}})
            }
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
            bc = await bwipjs.toBuffer({
                bcid:        'interleaved2of5',     
                text:        seat.uuid, 
                includetext: true,  
                textxalign:  'center',   
            })
            
           
                let doc = new PDFDocument({size: 'A4'});
                doc.pipe(fs.createWriteStream(directory+'/'+seat.uuid+'.pdf')); 
                doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  421,85,{ height:66})
                .fontSize(15) 
                    .text(sector,254,31) //264, 63)
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
                    .text(sector, 130, 151)
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
            let aa = await Seat.findAll({where:{active:true, statusId:2}})
            let bb = await Balcon.findAll({where:{active:true, statusId:2}})
            for(let balc of bb){
                aa.push(balc)
            }
            return res.send(aa)
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    async bookBalcon(req,res){
        try{
            let bc
            let {id} = req.body
            //filterInput(req.body) soon
            let seat = await Balcon.findOne({where:{id, active:true, statusId:2}})
            console.log(seat)
            if(!seat)
                return res.status(400).send({error:'Место уже занято'})
            if(seat.statusId==3){
                return res.status(400).send({error:'Место уже занято'})
            }
            let response = await Balcon.update({statusId:3, email:seat.email },{where:{id}})
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
            let row=seat.row
            let event = await Event.findOne({order: [ [ 'createdAt', 'DESC' ]],})
            let date = new Date(event.date)
            var datestring = date.getDate()  + "." + (date.getMonth()+1) + "." + date.getFullYear()
            const directory = __dirname+'/../tickets';
            bc = await bwipjs.toBuffer({
                bcid:        'interleaved2of5',     
                text:        seat.uuid, 
                includetext: true,  
                textxalign:  'center',   
            })
            
           
                let doc = new PDFDocument({size: 'A4'});
                doc.pipe(fs.createWriteStream(directory+'/'+seat.uuid+'.pdf')); 
                doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  421,85,{ height:66})
                .fontSize(15) 
                    .text(sector,254,31) //264, 63)
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
                    .text(sector, 130, 151)
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
            let aa = await Seat.findAll({where:{active:true, statusId:2}})
            let bb = await Balcon.findAll({where:{active:true, statusId:2}})
            for(let balc of bb){
                aa.push(balc)
            }
            return res.send(aa)
        }catch(e){
            console.log(e)
            return res.send({error:"Unhandled error"})
        }
    }
    async declineBooking(req, res){
        try{
            let {id} = req.body
            let seat = await Seat.findOne({where:{id, active:true, statusId:2}})
            console.log(seat)
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            let uid = Math.floor(Math.random() * 10000000000000)
            let response = await Seat.update({statusId:1, email:'', uuid:uid},{where:{id}})
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
            
            const directory = __dirname+'/../tickets';
            let bc = await bwipjs.toBuffer({
                bcid:        'interleaved2of5',     
                text:        uid, 
                includetext: true,  
                textxalign:  'center',   
            }) 
            fs.unlink(directory+'/'+seat.uuid+'.pdf', async (err) => {
                if (err) throw err;
                })
            let doc = new PDFDocument({size: 'A4'});
                doc.pipe(fs.createWriteStream(directory+'/'+uid+'.pdf')); 
                doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  421,85,{ height:66})
                .fontSize(15) 
                    .text(sector,254,31) //264, 63)
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
                    .text(sector, 130, 151)
                    .restore()
                doc.end()
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
            let aa = await Seat.findAll({where:{active:true, statusId:2}})
            let bb = await Balcon.findAll({where:{active:true, statusId:2}})
            for(let balc of bb){
                aa.push(balc)
            }
            return res.send(aa)
        }catch(e){
            console.log(e)
            return res.status(500).send({error:"Unhandled error"})
        }
    }
    async declineBalcon(req, res){
        try{
            let {id} = req.body
            //filterInput(req.body) soon
        console.log(req.body)
            let seat = await Balcon.findOne({where:{id}})
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            let uid = Math.floor(Math.random() * 10000000000000)
            let response = await Balcon.update({statusId:1, email:'', uuid:uid},{where:{id}})
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
            
            const directory = __dirname+'/../tickets';
            let bc = await bwipjs.toBuffer({
                bcid:        'interleaved2of5',     
                text:        uid, 
                includetext: true,  
                textxalign:  'center',   
            }) 
            fs.unlink(directory+'/'+seat.uuid+'.pdf', async (err) => {
                if (err) throw err;
                })
            let doc = new PDFDocument({size: 'A4'});
                doc.pipe(fs.createWriteStream(directory+'/'+uid+'.pdf')); 
                doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  421,85,{ height:66})
                .fontSize(15) 
                    .text(sector,254,31) //264, 63)
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
                    .text(sector, 130, 151)
                    .restore()
                doc.end()
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
    async requestBalcon(req,res){
        try{
            console.log(req.body)
            let ticket= req.body
            let email=ticket.email
            let re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g
            let text = ``
            let row=0
            if(!re.test(email))
                return res.status(400).send({error:'Неверно указан email'})
            let seat = await Balcon.findOne({where:{active:true, row:ticket.row, col:ticket.col, sectorId:ticket.sectorId}})
            if(!seat)
                return res.status(404).send({error:'Неверно указано место'})
            if(seat.statusId!=1)
                return res.status(404).send({error:'Место уже забронировано'})
            let response = await Balcon.update({statusId:2, email },{where:{active:true, row:ticket.row, col:ticket.col, sectorId:ticket.sectorId}})
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
            row=seat.row
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
    async changeEmail(req,res){
        let {id} = req.params
        let {email} = req.body
        let seat= await Seat.findOne({where:{id:id,active:true, statusId:3} })
        let result 
        result= await Seat.update({email },{where:{id, active:true, statusId:3}})
        if(!seat){
            seat= await Balcon.findOne({where:{id:id,active:true, statusId:3} })
            result = await Balcon.update({email },{where:{id, active:true, statusId:3}})
        }
            
       
       //let seat= await Seat.findOne({where:{id:id} })
        let bc
        let row=-6
       
        
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
        bc = await bwipjs.toBuffer({
            bcid:        'interleaved2of5',     
            text:        parseInt(seat.uuid), 
            includetext: true,  
            textxalign:  'center',   
        })
        
       
            let doc = new PDFDocument({size: 'A4'});
            doc.pipe(fs.createWriteStream(directory+'/'+seat.uuid+'.pdf')); 
            doc.image(__dirname+'/ticket.jpeg', 0, 0,{width:595})
            doc.image('data:image/png;base64,'+bc.toString('base64'),  421,85,{ height:66})
            .fontSize(15) 
                .text(sector,254,31) //264, 63)
                .text(email,264, 63)
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
                .text(sector, 130, 151)
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
        //return res.send(response)
    }
    async changeEmailBalcon(req,res){
        let {id} = req.params
        let {email} = req.body
        let response = await Balcon.update({email },{where:{id}})
        return res.send(response)
    }
    async downloadTicket(req,res){
        let {id} = req.params
        let seat = await Seat.findOne({where:{id}})
        let file = path.join(__dirname,`../tickets/${seat.uuid}.pdf`) 
        return res.set('Content-Disposition',`attachment; filename="ticket.pdf"`).sendFile(file)
    }
    async resend(req,res){
       
            let {id} = req.params
            let seat = await Seat.findOne({where:{id}})
           
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `Бронь места`,
                attachments: [
                    {   // file on disk as an attachment
                        filename: 'ticket.pdf',
                        path: __dirname+'/../tickets/'+seat.uuid+'.pdf' // stream this file
                    }],
                text: `<h4>Ваш билет</h4>
                        `
            };
            
            transporter.sendMail(mailOptions, function(error, info){
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
            return res.send({res:"Билет продублирован на почту"})
    }
    
    
}


let manager = new Manager()
module.exports = manager