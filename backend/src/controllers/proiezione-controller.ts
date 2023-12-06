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
        `SELECT s.idsala, s.fila, s.posti_fila, p.idproiezione FROM sale s join proiezioni p on s.idsala = p.idsala where idproiezione = ?`, 
        [req.params.id],
    )
    res.json(results)
}

export async function postiX(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idposto, idproiezione, fila, numero, occupato, speciale FROM posti_proiezione where idproiezione = ? AND fila = ?`, 
        [req.params.id,req.params.fila],
        
    )
    res.json(results)
}