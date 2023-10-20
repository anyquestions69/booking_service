const express = require("express");
const eventController = require("../controllers/eventController.js");
const eventRouter = express.Router();
 

eventRouter.get("/", eventController.getAll);
eventRouter.get("/:eventId", eventController.getOne);
eventRouter.post('/', eventController.addOne)
eventRouter.delete('/:eventId', eventController.deleteOne)

 
module.exports = eventRouter