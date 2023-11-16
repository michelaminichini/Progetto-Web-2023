import express, {Express} from "express"
import history from "connect-history-api-fallback"

const app: Express = express()
const port: number = 3000

app.use(history())
app.use(express.static("public"))
//app.use(express.static("dist-frontend"))



app.use(function(req, res, next) {
    res.setHeader("Content-Type", "text/plain")
    res.status(404).send("Ops... Pagina non trovata")
  })
  
  app.listen(port, function() {
    console.log(`Listening on http://localhost:${port}`)
  })