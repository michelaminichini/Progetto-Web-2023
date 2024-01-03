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
router.delete("/api/eliminaproj/:id", filmController.deleteProj)
router.get("/api/cronologia/:id", filmController.cronologiaUtente)
router.get("/api/infoToUpdate", filmController.informazioni)
router.post("/api/nuovaproj", filmController.nuovaProiezione)
router.get("/api/activefilms", filmController.ActiveFilms)
router.get("/api/listasale", filmController.ElencoSale)
router.get("/api/editfilm/:id", filmController.editFilm)

export default router
