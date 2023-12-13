import { Router } from "express"
import * as updateDataController from "../controllers/updateData-controller"

const router = Router()

//router.put("/api/update/aggiornaDati", updateDataController.updateData)
router.post("/api/aggiorna/pagamento", updateDataController.aggiornaDatiPagamentoUtente)

export default router
