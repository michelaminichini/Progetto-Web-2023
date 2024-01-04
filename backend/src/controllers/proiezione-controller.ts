import { Request, Response } from "express";
import {getConnection} from "../utils/db"


export async function proiezioneX(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idproiezione FROM proiezioni`,
        [],
    )
    res.json(results)
}

export async function salaX(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT sale.idsala, sale.fila, sale.posti_fila FROM sale JOIN proiezioni ON sale.idsala = proiezioni.idsala WHERE idproiezione = ?`,
        [req.params.id],
    )
    res.json(results)
}

export async function postiF(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT label,selected,occupato,costo FROM posti_proiezione WHERE idproiezione = ?`, 
        [req.params.id],
    )
    res.json(results)
}
// Aggiorna lo stato del sedile prenotato dall'utente
export async function aggiornaPostoPF(req:Request, res: Response) {
    const {idproiezione, label} = req.body
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `UPDATE posti_proiezione SET occupato = 1 WHERE idproiezione = ? AND label = ?`,
        [idproiezione,label]
    )
    res.json(results)
}

