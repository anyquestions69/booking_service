const express = require("express");
const userController = require("../controllers/userController.js");
const userRouter = express.Router();
 
userRouter.post('/register', userController.register)
userRouter.post('/login', userController.login)
userRouter.post('/forgotPassword', userController.forgot)

 
module.exports = userRouter;