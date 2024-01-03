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
/*
export async function postiX(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idposto, idproiezione, fila, numero, occupato, speciale FROM posti_proiezione WHERE idproiezione = ?`, 
        [req.params.id],
    )
    res.json(results)
    console.log(res)
}
*/
export async function postiF(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT label,selected,occupato,costo FROM posti_proiezione WHERE idproiezione = ?`, 
        [req.params.id],
    )
    res.json(results)
    //console.log(res)
}
/*
export const getPostiL = async (req:Request, res:Response) => {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT label,selected,occupato FROM posti_proiezione WHERE idproiezione = 9`
    )
    res.json(results)
}
*/


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

export async function aggiornaParamP(req:Request, res: Response) {
    const {idproiezione,importo,Seats} = req.body
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `UPDATE temp SET id_proiezione = ?,importo = ?, posti = ? WHERE id=1`,
        [idproiezione,importo,Seats]
    )
    res.json(results)
}

export async function leggiParamP(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT id_proiezione,importo,posti FROM temp WHERE id = 1`,
        [],
    )
    res.json(results)
}