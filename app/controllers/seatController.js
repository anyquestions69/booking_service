const {Seat, Event, Balcon} = require('../models/user')
const { Op } = require("sequelize");
const { createTransport } = require('nodemailer');
const PDFDocument = require('pdfkit');
const fs=require('fs')
const bwipjs = require('bwip-js');
const path = require("path")

const transporter = createTransport({
    host: process.env.SMTP_SERVER,
    port:465,
    auth: {
     
      user: process.env.SMTP_MAIL,
      pass: process.env.SMTP_PASSWORD
    },
  });
  
const mailText=`<b>БИЛЕТ НА BIG BEAUTY BOSS VEGAS</b>

Поздравляем! Вы успешно зарегистрированы на форум BIG BEAUTY BOSS VEGAS! ВАШ БИЛЕТ ПРИКРЕПЛЕН ФАЙЛОМ К ЭТОМУ СООБЩЕНИЮ!<br>

Организационная информация для участника:<br>

🕘 ВО СКОЛЬКО ПРИХОДИТЬ НА ФОРУМ: к 08:30 Мск (регистрация + приветственный кофе-брейк ☕️ 🧁).<br>

🇷🇺 ГДЕ: концертный зал Vegas City Hall в торгово-развлекательном комплексе «VEGAS Крокус Сити». ВХОД ОСУЩЕСТВЛЯЕТСЯ СО СТОРОНЫ КОЛЕСА ОБОЗРЕНИЯ! <br>

‼️ Переход внутри метро, ведущий в ТРК Vegas, будет закрыт! <b>ВХОД ОСУЩЕСТВЛЯЕТСЯ ТОЛЬКО ЧЕРЕЗ ГЛАВНЫЙ ВХОД КОНЦЕРТНОГО ЗАЛА VEGAS CITY HALL</b> СО СТОРОНЫ УЛИЦЫ!<br>

⏰ КОГДА: 15 декабря 2023, пятница. <br>

📍АДРЕС: Международная ул., 12, Красногорск. <br>

🕰 НАЧАЛО ДЕЛОВОЙ ПРОГРАММЫ: в 10:00 Мск. <br>

📝 ДЛЯ РЕГИСТРАЦИИ: паспорт не нужен.   <br>

🎫 ЭЛЕКТРОННЫЙ БИЛЕТ: на 1 этаже Вас будет ждать зона регистрации! Вы подходите к стойке регистрации, показываете электронный билет, называете ФИО, после чего наши регистраторы выдадут вам официальный бейдж участника. <br>

💌 С СОБОЙ: возьмите, пожалуйста, свою визитку для участия в Вип-лотерее наших партнёров. <br>

🕺🏻ДРЕСС-КОД: \n

-  Для Уважаемых Дам: «Business Casual», «Black Tie» (платья, жакеты, классика и элегантность приветствуются);<br>
-  Для Уважаемых Господ: «Business Best» (костюм, галстук, классика и элегантность приветствуются).<br>

🚗 ПАРКОВКА: Вы можете воспользоваться парковкой торгового центра «VEGAS Крокус Сити». Стоимость парковки: первые 3 часа бесплатно, далее 100 рублей за 1 час.<br>

Лучшее решение, которое вы можете принять для экономии своего времени и сил, а также добраться до места с комфортом - это воспользоваться услугами такси. Вас подвезут прямо ко входу концертного зала и вам не придется решать вопросы с парковкой, оплатой, а также въездом и выездом.<br>

📘 АКТУАЛЬНАЯ ПРОГРАММА ПО ССЫЛКЕ:<br>
<a href='https://margocherniak.ru/bbbvegas#rec655424425'>https://margocherniak.ru/bbbvegas#rec655424425</a><br>

📌 УБЕДИТЕЛЬНАЯ ПРОСЬБА: ПРИХОДИТЕ К НАЧАЛУ РЕГИСТРАЦИИ В 8:30, ТАК КАК ОРГАНИЗАЦИОННЫЙ ПРОЦЕСС ТРЕБУЕТ ВРЕМЕНИ!<br>

После регистрации Вас ожидает приветственный кофе-брейк со вкусными угощениями перед стартом учебной программы. А также у Вас есть возможность посетить экспозону наших партнёров и первыми познакомиться с передовыми новинками аппаратных технологий, космецевтики и брендов med & beauty индустрии.<br>

По любым организационным и техническим вопросам обращайтесь напрямую к Вашему персональному менеджеру! <br>

Желаем Вам прекрасного настроения и успешного продуктивного обучения!<br>

Оргкомитет «BIG BEAUTY BOSS».`


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
            orderQuery=[['row', 'DESC'], ['col', 'ASC']]
        }else{
            orderQuery=[['row', 'ASC'], ['col', 'ASC']]
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
            for(let b of balcon){
                b.dataValues.balcon=1
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
                    b.dataValues.balcon=1
                    seats.push(b)
                }
                return res.send(seats)
            }
           
            
        }
    }
    async getBookedWithFilters(req,res){
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
            orderQuery=[['row', 'DESC'], ['col', 'ASC']]
        }else{
            orderQuery=[['row', 'ASC'], ['col', 'ASC']]
        }

        if(segment==3){
           
           
            if(sectorId.length>1){
                balcon = await Balcon.findAll({where:{
                    active:true,
                    row:rowQuery,
                    sectorId: {
                        [Op.or]: sectorId
                    },
                    statusId:3
                }, order: orderQuery
                })
            }else{
                balcon= await Balcon.findAll({where:{
                    active:true,
                    row:rowQuery,
                    sectorId: sectorId[0],
                    statusId:3
                }, order: orderQuery
                })
            }
            for(let b of balcon){
                b.dataValues.balcon=1
                //balcon.push(b)
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
                            },
                            statusId:3
                    }, order: orderQuery
                    })
                }else{
                        seats= await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0],
                        statusId:3
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
                            },
                            statusId:3
                    }, order: orderQuery
                    })
                }else{
                        seats= await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0],
                        statusId:3
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
                            },
                            statusId:3
                    }, order: orderQuery
                    })
                }else{
                        seats= await Seat.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0],
                        statusId:3
                    }, order: orderQuery
                    })
                }
                if(sectorId.length>1){
                    balcon = await Balcon.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: {
                            [Op.or]: sectorId
                        },
                        statusId:3
                    }, order: orderQuery
                    })
                }else{
                    balcon= await Balcon.findAll({where:{
                        active:true,
                        row:rowQuery,
                        sectorId: sectorId[0],
                        statusId:3
                    }, order: orderQuery
                    })
                }
                for(let b of balcon){
                    b.dataValues.balcon=1
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
            balc.dataValues.balcon=1
            console.log(balc)
            seats.push(balc)
        }
        console.log(seats)
        return res.send(seats)
    }
    async showBooked(req,res){
        let seats = await Seat.findAll({where:{active:true, statusId:3}})
        let balcon = await Balcon.findAll({where:{active:true, statusId:3}})
        for(let balc of balcon){
            balc.dataValues.balcon=1
            seats.push(balc)
            console.log(balc)
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
        seats = await Balcon.findAll({where:{active:true}})
        
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
                
            }
            segment='Балкон'
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
            let segment ='Parter'
            let row=-6
            console.log(seat)
            if(!seat){
                seat = await Balcon.findOne({where:{id, active:true,statusId:2}})
                row+=6
                segment ='Balcony'
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
                segment ='Arena'
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
                doc.image(__dirname+'/ticket.png', 0, 0,{width:595.28, height:841.89})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  265,680,{ height:86})
                .fontSize(15) 
                .text(row, 210, 452)
                .text(seat.col, 405, 458)
                .text(segment,210,504)
                .text(sector,215,559)
                .fontSize(12) 
                .text(seat.email,387, 505)
                .save()
                doc.end()
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `БИЛЕТ НА BIG BEAUTY BOSS VEGAS`,
                attachments: [
                    {   // file on disk as an attachment
                        filename: 'ticket.pdf',
                        path: __dirname+'/../tickets/'+seat.uuid+'.pdf' // stream this file
                    }],
                html: mailText
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
                balc.dataValues.balcon=1
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
            let segment='Balcony'
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
                doc.image(__dirname+'/ticket.png', 0, 0,{width:595.28, height:841.89})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  265,680,{ height:86})
                .fontSize(15) 
                .text(row, 210, 452)
                .text(seat.col, 405, 458)
                .text(segment,210,504)
                .text(sector,215,559)
                .fontSize(12) 
                .text(seat.email,387, 505)
                .save()
                doc.end()
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `БИЛЕТ НА BIG BEAUTY BOSS VEGAS`,
                attachments: [
                    {   // file on disk as an attachment
                        filename: 'ticket.pdf',
                        path: __dirname+'/../tickets/'+seat.uuid+'.pdf' // stream this file
                    }],
                html: mailText
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
                balc.dataValues.balcon=1
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
            let seat = await Seat.findOne({where:{id, active:true, statusId:3}})
            console.log(seat)
            if(!seat)
                return res.status(400).send({error:'Место указано не верно'})
            let uid = Math.floor(Math.random() * 10000000000000)
            let response = await Seat.update({statusId:1, email:'', uuid:uid},{where:{id}})
            let sector = ''
            let segment='Parter'
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
                segment='Arena'
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
                doc.image(__dirname+'/ticket.png', 0, 0,{width:595.28, height:841.89})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  265,680,{ height:86})
                .fontSize(15) 
                .text(row, 210, 452)
                .text(seat.col, 405, 458)
                .text(segment,210,504)
                .text(sector,215,559)
                .fontSize(12) 
                .text(seat.email,387, 505)
                .save()
                doc.end()
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `Бронь места отменена`,
                html: `<h4>Ваш запрос был отклонён менеджером</h4>
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
            let segment='Balcony'
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
                segment='Balcony'
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
                doc.image(__dirname+'/ticket.png', 0, 0,{width:595.28, height:841.89})
                doc.image('data:image/png;base64,'+bc.toString('base64'),  265,680,{ height:86})
                .fontSize(15) 
                .text(row, 210, 452)
                .text(seat.col, 405, 458)
                .text(segment,210,504)
                .text(sector,215,559)
                .fontSize(12) 
                .text(seat.email,387, 505)
                .save()
                doc.end()
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `Бронь места отменена`,
                html: `<h4>Ваш запрос был отклонён менеджером</h4>
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
            let segment='Stalls'
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
                html: text+`<p>email: ${email}</p>`
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
                html: text+`<p>email: ${email}</p>`
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
            return res.status(404).send({error:"Unhandled error"})
        }
    }
    async changeEmail(req,res){
        let {id} = req.params
        let {email} = req.body
        let seat= await Seat.findOne({where:{id:id,active:true, statusId:3} })
        let result 
        let segment='Parter'
        if(!seat){
            seat= await Balcon.findOne({where:{id:id,active:true, statusId:3} })
            result = await Balcon.update({email },{where:{id, active:true, statusId:3}})
            segment='Balcony'
        }else{
            result= await Seat.update({email },{where:{id, active:true, statusId:3}})
        }
            console.log(result)
       
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
            if(segment!='Balcony'){
                segment='Arena'
            }
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
            doc.image(__dirname+'/ticket.png', 0, 0,{width:595.28, height:841.89})
            doc.image('data:image/png;base64,'+bc.toString('base64'),  265,680,{ height:86})
            .fontSize(15) 
            .text(row, 210, 452)
            .text(seat.col, 405, 458)
            .text(segment,210,504)
            .text(sector,215,559)
            .fontSize(12) 
            .text(seat.email,387, 505)
            
                //.text(datestring, 340, 421)
            .save()
            doc.end()
        const mailOptions = {
            from: process.env.SMTP_MAIL,
            to: seat.email,
            subject: `БИЛЕТ НА BIG BEAUTY BOSS VEGAS`,
            attachments: [
                {   // file on disk as an attachment
                    filename: 'ticket.pdf',
                    path: __dirname+'/../tickets/'+seat.uuid+'.pdf' // stream this file
                }],
            html: mailText
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
        let seat= await Seat.findOne({where:{id:id,active:true, statusId:3} })
        let result 
        if(!seat){
            seat= await Balcon.findOne({where:{id:id,active:true, statusId:3} })
            result = await Balcon.update({email },{where:{id, active:true, statusId:3}})
        }else{
        result= await Seat.update({email },{where:{id, active:true, statusId:3}})
       
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
            text:        seat.uuid, 
            includetext: true,  
            textxalign:  'center',   
        })
        
       
            let doc = new PDFDocument({size: 'A4'});
            doc.pipe(fs.createWriteStream(directory+'/'+seat.uuid+'.pdf')); 
            doc.image(__dirname+'/ticket.png', 0, 0,{width:450})
            doc.image('data:image/png;base64,'+bc.toString('base64'),  421,85,{ height:66})
            .fontSize(14) 
            .text(row, 160, 342)
            .text(seat.col, 340, 344)
            .text(segment,160,383)
            .text(seat.email,293, 379)
            .text(sector,160,424)
                //.text(datestring, 340, 421)
            .save()
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
            html: `<h4>Ваше место успешно забронировано!</h4>
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
    async downloadTicket(req,res){
        let {id} = req.params
        let seat = await Seat.findOne({where:{id, active:true, statusId:3}})
        if(!seat){
            seat= await Balcon.findOne({where:{id:id,active:true, statusId:3} })
        }
        console.log(seat)
        let file = path.join(__dirname,`../tickets/${seat.uuid}.pdf`) 
        return res.set('Content-Disposition',`attachment; filename="ticket.pdf"`).sendFile(file)
    }
    async resend(req,res){
       
            let {id} = req.params
            let seat = await Seat.findOne({where:{id,active:true, statusId:3}})
            if(!seat){
                seat= await Balcon.findOne({where:{id:id,active:true, statusId:3} })
            }
            const mailOptions = {
                from: process.env.SMTP_MAIL,
                to: seat.email,
                subject: `БИЛЕТ НА BIG BEAUTY BOSS VEGAS`,
                attachments: [
                    {   // file on disk as an attachment
                        filename: 'ticket.pdf',
                        path: __dirname+'/../tickets/'+seat.uuid+'.pdf' // stream this file
                    }],
                html: mailText
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