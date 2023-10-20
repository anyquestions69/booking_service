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





sequelize.sync({force: false}).then(async function (result){


    
})
.catch(err=> console.log(err));

module.exports = { User}