import express, {Express} from "express"
import filmRouter from "./routes/film-router"
import proiezioneRouter from "./routes/proiezione-router"
import history from "connect-history-api-fallback"
import bodyParser from "body-parser"

//import { Request as ExpressRequest } from 'express';
//import { MulterFile } from 'multer';

// Extend the Request type to include the file property
//interface RequestWithFile extends ExpressRequest {
  //file: MulterFile;
//}

const app: Express = express()
const port: number = 3000

//const multer = require('multer');

//const storage = multer.memoryStorage(); // In-memory storage for simplicity
//const upload = multer({ storage: storage });

//app.post('/api/addfilm', upload.single('poster'), (req, res) => {
  //const { title, genre, director, year } = req.body;
  //const poster = req.file;

  // Process the film data and poster as needed (e.g., save to database)

  // Respond with a success status
  //res.status(201).send('Film added successfully');
//});

app.use(filmRouter)
app.use(proiezioneRouter)

app.use(history())
app.use(express.static("public"))
app.use(express.static("dist-frontend"))
app.use(bodyParser.json())

app.use(function(req, res, next) {
    res.setHeader("Content-Type", "text/plain")
    res.status(404).send("Ops... Pagina non trovata")
  })
  
  app.listen(port, function() {
    console.log(`Listening on http://localhost:${port}`)
  })