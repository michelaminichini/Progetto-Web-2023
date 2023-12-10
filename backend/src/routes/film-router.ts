import { Router } from "express";
import * as filmController from "../controllers/film-controller"

const router: Router = Router()

router.get("/api/films", filmController.currentFilm)
router.get("/api/prossimi-film", filmController.prossimiFilm)
router.get("/api/film/:id", filmController.scheda)
router.get("/api/tuttifilm",filmController.allFilms)
router.post("/api/inserimento", filmController.nuovofilm)
router.post("/api/aggiornamento", filmController.aggiornaFilm)

export default router
