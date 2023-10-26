const Sequelize = require("sequelize");
const sequelize = require('../config/database')

const User = sequelize.define("user", {
   
    email: {
      type: Sequelize.STRING,
      allowNull:false,
      unique:true
    },
    password: {
      type: Sequelize.STRING,
      allowNull:false
    }
  },{
    timestamps: false
  });

  const Seat = sequelize.define("seat", {
    id: {
      type: Sequelize.BIGINT,
      autoIncrement: true,
      primaryKey: true,
      allowNull: false
    },
    row: {
      type: Sequelize.INTEGER,
    },
    col: {
      type: Sequelize.INTEGER,
    },
    email: {
      type: Sequelize.STRING,
      allowNull:true
    },
    price:{
      type: Sequelize.FLOAT
    },
    active:{
      type:Sequelize.BOOLEAN,
      default:true
    }
  });
  const Event = sequelize.define("event", {
    id: {
      type: Sequelize.BIGINT,
      autoIncrement: true,
      primaryKey: true,
      allowNull: false
    },
    name: {
      type: Sequelize.TEXT,
    },
    date:{
      type:Sequelize.DATEONLY
    }
  });
  const Sector = sequelize.define('sector', {
    name:{
      type:Sequelize.TEXT
    }
  },{
    timestamps: false
  })
  const Status = sequelize.define('status', {
    name:{
      type:Sequelize.STRING
    }
  },{
    timestamps: false
  })

Event.hasMany(Seat, { onDelete: "cascade" })

Sector.hasMany(Seat, { onDelete: "cascade" })
Status.hasMany(Seat, { onDelete: "cascade"})

const sectors = [{name:"Arena"},{name:"Stalls"}, {name:"Silver"},{name:"Gold"}, {name:"Platinum"}, {name:"Disabled"}]
const status = [{name: "Свободно"}, {name: "Ожидает подтверждения"}, {name:"Забронирован"}]

sequelize.sync({force: false}).then(async function (result){
  if((await Sector.findAll()).length==0)
     await Sector.bulkCreate(sectors, { validate: true })
  if((await Status.findAll()).length==0)
    await Status.bulkCreate(status, { validate: true })
  if(!(await User.findOne({where:{email:process.env.ADMIN_EMAIL}})))
    await User.create({email:process.env.ADMIN_EMAIL, password:process.env.ADMIN_PASSWORD})
    
})
.catch(err=> console.log(err));

module.exports = { User, Seat, Event}