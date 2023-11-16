import { Request, Response } from "express";
import {connection} from "../utils/db"

export async function allFilms(req:Request, res: Response) {
    connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, attivo FROM film WHERE film.attivo = 1`,
    [],
    function (err, results, fields){
        res.json(results)
        }
    )
}