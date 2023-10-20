const express = require("express");
const eventController = require("../controllers/eventController.js");
const eventRouter = express.Router();
 
eventRouter.get("/", eventController.getAll);
eventRouter.post('/', eventController.addOne)

 
module.exports = eventRouter