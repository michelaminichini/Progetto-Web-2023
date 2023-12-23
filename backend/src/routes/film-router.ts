import { Router } from "express";
import * as filmController from "../controllers/film-controller"

const router: Router = Router()

router.get("/api/films", filmController.currentFilm)
router.get("/api/prossimi-film", filmController.prossimiFilm)
router.get("/api/film/:id", filmController.scheda)
router.get("/api/tuttifilm",filmController.allFilms)
router.post("/api/inserimento", filmController.nuovofilm)
router.put("/api/aggiornamento", filmController.aggiornaFilm)
router.put("/api/aggiorna-dati", filmController.aggiornaDati)
router.delete("/api/eliminazione/:id", filmController.deleteFilm)
router.delete("/api/cancella-dati/:id", filmController.cancellaDati)
router.get("/api/cronologia/:id", filmController.cronologiaUtente)
router.get("/api/infoToUpdate", filmController.informazioni)
router.post("/api/nuovi-dati", filmController.nuoviDati)

export default router
