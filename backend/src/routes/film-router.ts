import { Router } from "express";
import * as filmController from "../controllers/film-controller"

const router: Router = Router()

router.get("/api/films", filmController.currentFilm)
router.get("/api/prossimi-film", filmController.prossimiFilm)
router.get("/api/film/:id", filmController.scheda)
router.get("/api/tuttifilm",filmController.allFilms)
router.post("/api/inserimento", filmController.nuovofilm)
router.put("/api/aggiornamento", filmController.aggiornaFilm)
router.delete("/api/eliminazione/:id", filmController.deleteFilm)
router.get("/api/cronologia/:id", filmController.cronologiaUtente)
router.get("/api/infoToUpdate", filmController.informazioni)

export default router
