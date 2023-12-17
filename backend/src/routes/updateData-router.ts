import { Router } from "express"
import * as updateDataController from "../controllers/updateData-controller"

const router = Router()

router.post("/api/aggiornapagamento", updateDataController.aggiornaDatiPagamentoUtente)
router.get("/api/leggiutente/:id", updateDataController.leggiDatiProfiloPersonale)
router.put("/api/aggiornautente", updateDataController.aggiornaDatiProfilo)
router.get("/api/tipopag", updateDataController.leggiTipoPag)

export default router
