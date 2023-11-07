// Express
const express = require('express')
const app = express()
const cors = require('cors');
const userRouter = require('./routers/userRouter.js')
const seatRouter = require('./routers/seatRouter.js')
const eventRouter = require('./routers/eventRouter.js')

var cookieParser = require('cookie-parser');
const jsonParser = express.json();
app.use(cors({
  origin: '*'
}));
app.use(cookieParser());
app.use(jsonParser)


app.use('/users', userRouter)
app.use('/seat', seatRouter)
app.use('/event', eventRouter)

app.listen(3000, () => {
  console.log('Сервер запущен')
  console.log('server started')
})