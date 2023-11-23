import { Request, Response } from "express";
import {connection} from "../utils/db"

export async function allFilms(req:Request, res: Response) {
    connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, attivo FROM film`,
    [],
    function (err, results, fields){
        res.json(results)
        }
    )
}

export async function prossimiFilm(req:Request, res: Response) {
    connection.execute(
        `SELECT id_film, titolo_film, regista_film, genere_film, anno_uscita, descrizione, trailer, locandina FROM prossimamente`,
        [],
        function (err, results, fields){
            res.json(results)
        }
    )
}

export async function scheda(req:Request, res:Response) {
    connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, datap, orario FROM film, proiezioni WHERE idproiezione=proiezione AND idfilm=?`, 
        [req.params.id],
        function (err, results, fields){
            res.json(results)
        }
    )
}

