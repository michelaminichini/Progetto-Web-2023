import { Request, Response } from "express";
import {connection} from "../utils/db"
const bodyParser = require('body-parser')
const jsonParser = bodyParser.json({limit:'1mb'});

export async function allFilms(req:Request, res: Response) {
    connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, attivo FROM film WHERE attivo = 1`,
    [],
    function (err, results, fields){
        res.json(results)
        }
    )
}

export async function TUTTIFilms(req:Request, res: Response) {
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
        `SELECT idfilm, titolo, regista, genere, anno, descrizione, trailer, locandina, attivo FROM film WHERE attivo = 2`,
        [],
        function (err, results, fields){
            res.json(results)
        }
    )
}

export async function scheda(req:Request, res:Response) {
    connection.execute(
        `SELECT film.idfilm, film.titolo, film.locandina, film.regista, film.genere, film.anno, film.descrizione, p.idproiezione, p.datap, p.orario FROM film JOIN proiezioni p ON film.idfilm = p.idfilm WHERE film.idfilm=?`, 
        [req.params.id],
        function (err, results, fields){
            console.log(results)
            res.json(results)
        }
    )
}

export async function nuovofilm(req:Request, res: Response) {
    connection.execute(
        `INSERT INTO film (titolo) VALUES (' ')`,
    function (err, results, fields){
        console.log(results)
        }
    )
}






