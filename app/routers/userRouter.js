const express = require("express");
const userController = require("../controllers/userController.js");
const userRouter = express.Router();
const mw = require('../middleware/auth.js')
 
userRouter.get('/', mw.isAuth, userController.getAll)
userRouter.post('/register', userController.register)
userRouter.post('/login', userController.login)
userRouter.post('/forgotPassword', userController.forgot)

 
module.exports = userRouter;