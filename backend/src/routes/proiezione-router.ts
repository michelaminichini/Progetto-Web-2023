import { Router } from "express";
import * as proiezioneController from "../controllers/proiezione-controller"
//import * as seatController from "../controllers/proiezione-controller"

const router: Router = Router()

router.get("/api/proiezione", proiezioneController.proiezioneX)
router.get("/api/sala/:id", proiezioneController.salaX)
//router.get("/api/posti/:id", proiezioneController.postiX)
//router.get("/api/postiF/:id", proiezioneController.postiF)
router.get("/api/postiL", proiezioneController.getPostiL)
router.put("/api/aggiornaP", proiezioneController.aggiornaPosto)

export default router