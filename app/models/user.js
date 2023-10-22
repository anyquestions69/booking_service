const Sequelize = require("sequelize");
const sequelize = require('../config/database')
function hash(data){
  return 'aaa'+data
}

const User = sequelize.define("user", {
    id: {
      type: Sequelize.BIGINT,
      autoIncrement: true,
      primaryKey: true,
      allowNull: false
    },
    firstname: {
      type: Sequelize.STRING,
    },
    lastname: {
      type: Sequelize.STRING,
    },
    email: {
      type: Sequelize.STRING,
      allowNull:false,
      unique:true
    },
    password: {
      type: Sequelize.STRING,
      allowNull:false,
      set(value) {
        this.setDataValue('password', hash(value));
      }
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
    seatId:{
      type: Sequelize.STRING,
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
    
})
.catch(err=> console.log(err));

module.exports = { User, Seat, Event}