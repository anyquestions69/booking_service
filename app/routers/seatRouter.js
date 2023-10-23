const express = require("express");
const seatController = require("../controllers/seatController.js");
const seatRouter = express.Router();
 
seatRouter.get("/", seatController.getAll);
seatRouter.put('/', seatController.updatePrice)
seatRouter.post('/request', seatController.requestBooking)
seatRouter.post('/', seatController.bookOne)

 
module.exports = seatRouter;