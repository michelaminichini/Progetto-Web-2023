import { Request, Response } from "express";
import {connection} from "../utils/db"


export async function proiezioneX(req:Request, res:Response) {
    connection.execute(
        `SELECT idproiezione FROM proiezioni`,
        [],
        function (err, results, fields){
            console.log(results)
            res.json(results)
        }
    )
}

export async function salaX(req:Request, res:Response) {
    connection.execute(
        `SELECT s.idsala, s.fila, s.posti_fila, p.idproiezione FROM sale s join proiezioni p on s.idsala = p.idsala where idproiezione = ?`, 
        [req.params.id],
        function (err, results, fields){
            console.log(results)
            res.json(results)
    }
    )
}