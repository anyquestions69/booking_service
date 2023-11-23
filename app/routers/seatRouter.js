const express = require("express");
const seatController = require("../controllers/seatController.js");
const seatRouter = express.Router();
const mw = require('../middleware/auth.js')
seatRouter.get("/requests", mw.isAuth, seatController.showRequests);
seatRouter.get("/booked", mw.isAuth, seatController.showBooked);
seatRouter.get("/list", seatController.getList);
seatRouter.post('/download/:id', mw.isAuth, seatController.downloadTicket)
seatRouter.get('/:uuid', seatController.getPlace)
seatRouter.get("/", seatController.getAll);

seatRouter.put('/', mw.isAuth, seatController.updatePrice)
seatRouter.post('/request',  seatController.requestBooking)
seatRouter.post('/decline', mw.isAuth, seatController.declineBooking)
seatRouter.post('/:id', mw.isAuth, seatController.changeEmail)
seatRouter.post('/', mw.isAuth, seatController.bookOne)

 
module.exports = seatRouter;