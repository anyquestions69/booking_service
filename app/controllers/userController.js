const {User} = require('../models/user')
const { Op } = require("sequelize");
const Sequelize = require('sequelize')
const jwt = require('jsonwebtoken')
const { createTransport } = require('nodemailer');
const transporter = createTransport({
    host: process.env.SMTP_SERVER,
    port:587,
    secure: false,
    auth: {
     
      user: process.env.SMTP_MAIL,
      pass: process.env.SMTP_PASSWORD
    },
  });


class Manager{
   
    async getOne(req,res){
        let user = await User.findOne({where:{id:req.params['id']}})
        return res.send(user)
    }

    async getAll(req,res){
        let page=req.query.page
        var limit =5
        let result= await User.findAndCountAll( {offset: page>=1?((page-1)*2):0, limit: limit})
        return res.send(result)
    }

    async register(req, res){
        try{
            let {firstname, lastname, email, password,repass} = req.body
            if(email)
                if(email.replace(' ','')=='')
                    return res.status(401).send('Заполните ФИО')
            let re = /(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})/g
            if(re.test(email) | re.test(password))
                return res.status(401).send('Не пытайтесь взломать нас')
            if(repass!=password)
                return res.status(401).send('Пароли не совпадают')
           
            let exists = await User.findOne({where:{email:email}})
            if(exists)
                return res.status(401).send('Пользователь с таким именем уже существует. Попросите администратора удалить Ваш старый аккаунт прежде чем создавать новый.')
            let user = await User.create({
                firstname,
                lastname,
                email:email,
                password:password,
                
            })
            const token = jwt.sign({id:user.id, email:user.email}, process.env.TOKEN_SECRET, { expiresIn: '360000s' });
            return res.cookie('user',token, { maxAge: 1200000, httpOnly: true }).send(user.email)
        }catch(e){
            console.log(e)
            return res.status(404).send('Ошибка')
        }
    }

    async login(req,res){
        try{
            let {email, password} = req.body
            /* let re=/^0x[a-fA-F0-9]{40}$/g
            if(!re.test(wallet))
                return res.status(401).send({error:'Введите валидный адрес кошелька'}) */
            let user = await User.findOne({where:{email}})
            
            if(!user)
                return res.status(401).send({error:'Такого email не существует'})
            
            if(user.password==password){
                const token = jwt.sign({id:user.id, email:user.email}, process.env.TOKEN_SECRET, { expiresIn: '360000s' });
                return res.cookie('user',token, { maxAge: 900000, httpOnly: true }).send(user)
            }else{
                return res.status(404).send({error:'Неверный пароль'})
            }
        }catch(e){
            console.log(e)
            return res.status(405).send({error:e})
        }
    }

    async logout(req,res){
        return res.clearCookie("user").status(200);
    }


    async update(req,res){
        try {
            let {name, password} = req.body
            if(name){
                if(name.replace(' ','')=='')
                    return res.status(401).send('Заполните ФИО')
            }
            let re = /(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})/g
            if(re.test(name) | re.test(password))
                return res.status(401).send('Не пытайтесь взломать нас')
            
                let usr = await User.update({name:name},{where:{id:req.user.id}})
                return res.send(usr)
        
        } catch (error) {
            return res.status(404).send('Неверный пароль')
        }
    }
    async forgot(req,res){
        try {
            
                let usr = await User.findOne({email:process.env.ADMIN_MAIL})
                const mailOptions = {
                    from: process.env.SMTP_MAIL,
                    to: usr.email,
                    subject: `Пароль`,
                    text: usr.password
                };
                
                transporter.sendMail(mailOptions, function(error, info){
                    if (error) {
                        console.log(error);
                    } else {
                        console.log('Email sent: ' + info.response);
                    }
                });
                return res.send({msg:'Sent password to email'})
        
        } catch (error) {
            return res.status(404).send(e)
        }
    }
    
    
}
let manager = new Manager()
module.exports = manager