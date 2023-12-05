import bodyParser from "body-parser"
import cookieParser from "cookie-parser"
import express, {Express} from "express"
import filmRouter from "./routes/film-router"
import proiezioneRouter from "./routes/proiezione-router"
import history from "connect-history-api-fallback"

import authRouter from "./routes/auth-router"

const app: Express = express()
const port: number = 3000

app.use(bodyParser.json())
app.use(cookieParser()) // consente ad express di leggere e scrivere i cookie

app.use(filmRouter)
app.use(proiezioneRouter)

app.use(authRouter)

app.use(history())
app.use(express.static("public"))
app.use(express.static("dist-frontend"))

app.use(function(req, res, next) {
    res.setHeader("Content-Type", "text/plain")
    res.status(404).send("Ops... Pagina non trovata")
  })
  
  app.listen(port, function() {
    console.log(`Listening on http://localhost:${port}`)
  })