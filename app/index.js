// Express
const express = require('express')
const app = express()

const userRouter = require('./routers/userRouter.js')
const authRouter = require('./routers/authRouter.js')
const seatRouter = require('./routers/seatRouter.js')
const eventRouter = require('./routers/eventRouter.js')

var cookieParser = require('cookie-parser');
const jsonParser = express.json();
app.use(cookieParser());
app.use(jsonParser)


app.use('/users', userRouter)
app.use('/auth', authRouter)
app.use('/seat', seatRouter)
app.use('/event', eventRouter)

app.listen(3000, () => {
  console.log('Сервер запущен')
  console.log('server started')
})