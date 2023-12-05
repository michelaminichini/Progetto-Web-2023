import { Router } from "express";
import * as filmController from "../controllers/film-controller"

const router: Router = Router()

router.get("/api/films", filmController.allFilms)
router.get("/api/prossimi-film", filmController.prossimiFilm)
router.get("/api/film/:id", filmController.scheda)
router.get("/api/tuttifilm",filmController.TUTTIFilms)
router.post("/api/inserimento", filmController.nuovofilm)



export default router
