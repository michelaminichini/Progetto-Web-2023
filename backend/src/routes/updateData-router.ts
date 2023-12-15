import { Router } from "express"
import * as updateDataController from "../controllers/updateData-controller"

const router = Router()

router.put("/api/update/aggiornaDati", updateDataController.updateData)
router.post("/api/aggiornapagamento", updateDataController.aggiornaDatiPagamentoUtente)
router.get("/api/leggiutente/:id", updateDataController.leggiDatiProfiloPersonale)
router.put("/api/aggiornautente", updateDataController.aggiornaDatiProfilo)

export default router
