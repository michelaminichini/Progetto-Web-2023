import { Router } from "express";
import * as proiezioneController from "../controllers/proiezione-controller"
//import * as seatController from "../controllers/proiezione-controller"

const router: Router = Router()

router.get("/api/proiezione", proiezioneController.proiezioneX)
router.get("/api/sala/:id", proiezioneController.salaX)
router.get("/api/postiF/:id", proiezioneController.postiF)
router.put("/api/aggiornaPF", proiezioneController.aggiornaPostoPF)
router.get("/api/leggiproj", proiezioneController.idnuovaproj)
router.post("/api/aggiornaPP/:ids", proiezioneController.aggiornaPostiProj)
router.post("/api/aggiornaIdP/:idp", proiezioneController.aggiornaIdProj)
router.post("/api/nuovaproj", proiezioneController.nuovaProiezione)
router.delete("/api/eliminaproj/:id", proiezioneController.deleteProj)
router.delete("/api/cancella-dati/:id", proiezioneController.cancellaDati)

export default router