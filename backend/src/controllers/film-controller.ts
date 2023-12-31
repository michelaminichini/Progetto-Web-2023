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

export async function ActiveFilms(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, stato FROM film WHERE stato > 0`,
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
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, stato FROM film WHERE film.idfilm=?`, 
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
        `SELECT idfilm, titolo, regista, genere, durata, nazione, anno, descrizione, trailer, locandina, lingua, attori, stato FROM film WHERE stato=1`,
        [],
    )
    res.json(results)
}

export async function editFilm(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT * FROM film WHERE idfilm=?`, 
        [req.params.id],
    )
    res.json(results)
}

export async function ElencoSale(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT * FROM sale`,
    )
    res.json(results)
}

// Aggiorna le modifiche effettuate dall'amministratore nella pagina del pannello di controllo - dedicato all'admin
export async function aggiornaFilm(req:Request, res: Response) {
    const {idfilm,titolo,regista,genere,durata,nazione,anno,descrizione,trailer,locandina,lingua,attori,stato} = req.body
    console.log('Query')
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `UPDATE film SET titolo=?, regista=?, genere=?, durata=?, nazione=?, anno=?, descrizione=?, trailer=?, locandina=?,lingua=?, attori=?, stato=? WHERE idfilm=?`,
        [titolo,regista,genere,durata,nazione,anno,descrizione,trailer,locandina,lingua,attori,stato,idfilm],
    )
    res.json(results)
}
// Cancellazione riga di un film dalla tabella admin - operazione solo per amministratori
export async function deleteFilm(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `DELETE FROM film WHERE idfilm=?`,
        [req.params.id],
    )
    res.json(results)
}

export async function aggiornaDati(req:Request, res: Response) {
    const {idfilm,idsala, datap, orario, idproiezione} = req.body
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `UPDATE proiezioni SET idfilm=?, idsala=?, datap=?, orario=? WHERE idproiezione=?`,
        [idfilm, idsala, datap, orario, idproiezione],
    )
    res.json(results)
}

// Gestione cronologia dell'utente in base al suo ID. Premendo la terza icona nel profilo personale dell'utente, si visualizza la cronologia 
export async function cronologiaUtente(req:Request, res: Response) {
    try {
        const connection = await getConnection()
        const [results] = await connection.execute(
            `SELECT idutente, film.idfilm, titolo, idbiglietto, idtipo_pagamento1, importo, proiezioni.idproiezione, proiezioni.idsala, datap, orario, sale.descrizione, tipo_pagamenti.Descrizione, tipo_pagamenti.circuito FROM biglietti JOIN pagamenti ON (biglietti.idpagamento1 = pagamenti.idpagamento) JOIN tipo_pagamenti ON ( pagamenti.idtipo_pagamento1 = tipo_pagamenti.idtipo_pagamento) JOIN proiezioni ON (biglietti.idproiezione1 = proiezioni.idproiezione) JOIN sale ON (sale.idsala = proiezioni.idsala) JOIN film ON (proiezioni.idfilm = film.idfilm) WHERE idutente=?`,
            [req.params.id],
        );
        res.json(results)
    } catch (error) {
        console.error('Error executing SQL query:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
    
}
// Prendere informazioni dalla tabella proiezioni sul database per la tabella admin - pannello 2
export async function informazioni(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT film.idfilm, film.titolo, p.idproiezione, p.idsala, CONCAT(p.datap,' ') as dataorap, p.orario FROM film JOIN proiezioni p ON film.idfilm = p.idfilm`, 
        [],
    )
    res.json(results)
}

export async function elencoP(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT film.idfilm, film.titolo, film.locandina, film.regista, film.genere, film.anno, film.descrizione, p.idproiezione, p.datap, p.orario, CONCAT(p.datap,' ',p.orario) as dataorap FROM film JOIN proiezioni p ON film.idfilm = p.idfilm  WHERE film.idfilm=? ORDER BY datap,orario`, 
        [req.params.id],
    )
    res.json(results)
}