import { Request, Response } from "express";
import {getConnection} from "../utils/db"

export async function allFilms(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, attivo FROM film`,
    [],
   
    )
    res.json(results)
}

export async function prossimiFilm(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT id_film, titolo_film, regista_film, genere_film, anno_uscita, descrizione, trailer, locandina FROM prossimamente`,
        [],
    
    )
    res.json(results)
}

export async function scheda(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT film.idfilm, film.titolo, film.locandina, film.regista, film.genere, film.anno, film.descrizione, p.idproiezione, p.datap, p.orario FROM film JOIN proiezioni p ON film.idfilm = p.idfilm WHERE film.idfilm=?`, 
        [req.params.id],
        
    )
    res.json(results)
}

export async function nuovofilm(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `INSERT INTO film (titolo) VALUES (' ')`,
    )
    res.json(results)
}






