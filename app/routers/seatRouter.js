const express = require("express");
const seatController = require("../controllers/seatController.js");
const seatRouter = express.Router();
 
seatRouter.get("/", seatController.getAll);
seatRouter.get('/:eventId/:row/:col', seatController.getOne)
seatRouter.post('/:eventId', seatController.bookOne)

 
module.exports = seatRouter;