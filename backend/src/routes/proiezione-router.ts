import { Router } from "express";
import * as proiezioneController from "../controllers/proiezione-controller"
//import * as seatController from "../controllers/proiezione-controller"

const router: Router = Router()

router.get("/api/proiezione", proiezioneController.proiezioneX)
router.get("/api/sala/:id", proiezioneController.salaX)
router.get("/api/postiF/:id", proiezioneController.postiF)
router.put("/api/aggiornaPF", proiezioneController.aggiornaPostoPF)

export default router