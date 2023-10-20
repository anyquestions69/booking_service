const Sequelize = require("sequelize");
const sequelize = require('../config/database')


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
      allowNull:false,
      unique:true
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
      type:Sequelize.DATE
    }
  });





sequelize.sync({force: false}).then(async function (result){


    
})
.catch(err=> console.log(err));

module.exports = { User, Seat, Event}