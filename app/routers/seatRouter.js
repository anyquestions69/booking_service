const express = require("express");
const seatController = require("../controllers/seatController.js");
const seatRouter = express.Router();
const mw = require('../middleware/auth.js')
seatRouter.get("/requests", mw.isAuth, seatController.showRequests);
seatRouter.get("/balcon/requests", mw.isAuth, seatController.showRequests);
seatRouter.get("/booked", mw.isAuth, seatController.showBooked);
seatRouter.get("/balcon", seatController.getBalcon);
seatRouter.get("/list", seatController.getList);
seatRouter.get('/filter', mw.isAuth, seatController.getAllWithFilters)
seatRouter.get('/download/:id', mw.isAuth, seatController.downloadTicket)
seatRouter.get('/resend/:id', mw.isAuth, seatController.resend)
seatRouter.get('/:uuid', seatController.getPlace)
seatRouter.get("/", seatController.getAll);

seatRouter.put('/', mw.isAuth, seatController.updatePrice)
seatRouter.post('/balcon/request',  seatController.requestBalcon)
seatRouter.post('/request',  seatController.requestBooking)
seatRouter.post('/balcon/decline', mw.isAuth, seatController.declineBalcon)
seatRouter.post('/decline', mw.isAuth, seatController.declineBooking)
seatRouter.post('/balcon', mw.isAuth, seatController.bookBalcon)
seatRouter.post('/:id', mw.isAuth, seatController.changeEmail)
seatRouter.post('/', mw.isAuth, seatController.bookOne)

 
module.exports = seatRouter;