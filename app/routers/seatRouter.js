const express = require("express");
const seatController = require("../controllers/seatController.js");
const seatRouter = express.Router();
 
seatRouter.get("/", seatController.getAll);
seatRouter.get('/:row/:col', seatController.getOne)

 
module.exports = seatRouter;