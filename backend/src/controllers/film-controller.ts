import { Request, Response } from "express";
import {getConnection} from "../utils/db"

export async function allFilms(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, stato FROM film`,
    [],
    )
    res.json(results)
}

export async function prossimiFilm(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idfilm, titolo, regista, genere, anno, descrizione, trailer, locandina FROM film WHERE stato=2`,
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

export async function currentFilm(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idfilm, titolo, regista, genere, anno, descrizione, trailer, locandina,lingua, attori FROM film WHERE stato=1`,
        [],
    )
    res.json(results)
}

export async function aggiornaFilm(req:Request, res: Response) {
    const {idfilm,titolo,regista,genere,durata,nazione,anno,descrizione,
        trailer,locandina,lingua,attori,stato} = req.body
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `UPDATE film SET titolo=?, regista=?, genere=?, durata=?, nazione=?, anno=?, descrizione=?, trailer=?, locandina=?,lingua=?, attori=?, stato=? WHERE idfilm=?`,
        [titolo,regista,genere,durata,nazione,anno,descrizione,trailer,locandina,lingua,attori,stato,idfilm],
    )
    res.json(results)
}

export async function deleteFilm(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `DELETE FROM film WHERE idfilm=?`,
        [req.params.id],
    )
    res.json(results)
}

