import { Router } from "express"
import * as updateDataController from "../controllers/updateData-controller"

const router = Router()

router.put("/api/update/aggiornaDati", updateDataController.updateData)

export default router
