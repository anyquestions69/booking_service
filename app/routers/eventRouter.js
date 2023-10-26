const express = require("express");
const eventController = require("../controllers/eventController.js");
const eventRouter = express.Router();
const mw = require('../middleware/auth.js')

eventRouter.get("/", mw.isAuth,eventController.getAll);
eventRouter.get("/:eventId", mw.isAuth, eventController.getOne);
eventRouter.post('/', mw.isAuth, eventController.addOne)
eventRouter.delete('/:eventId', mw.isAuth, eventController.deleteOne)

 
module.exports = eventRouter