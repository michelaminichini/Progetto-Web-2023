import { Router } from "express";
import * as filmController from "../controllers/film-controller"

const router: Router = Router()

router.get("/api/films", filmController.allFilms)
router.get("/api/prossimi-film", filmController.prossimiFilm)
router.get("/api/film/:idfilm", filmController.scheda)



export default router