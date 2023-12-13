import { Request, Response } from "express";
import {getConnection} from "../utils/db"
import { decodeAccessToken } from "../utils/auth";

/*

export const updateData = async (req: Request, res: Response) => {
    //console.log('Update profile route reached');
    //const { email } = req.params;
    const { email, nome, cognome, telefono, data_nascita } = req.body
    console.log('Request body:', req.body) // appurato che viene stampato in console

    
    //const [users] = await connection.execute(`SELECT email FROM utente WHERE email=?`, [email])
    // Errore se l'utente non è stato trovato
   // if (!Array.isArray(users) || users.length == 0) {
    //    res.status(400).send("Credenziali errate.")
     //   return
    //}
    const user = decodeAccessToken(req, res)
    res.json(user)
    //const user = users[0] as any
    const connection = await getConnection()
    const [risultati] = await connection.execute(`UPDATE utente SET nome=?, cognome=?, telefono=?, data_nascita=? WHERE email=?`, [nome, cognome, telefono, data_nascita, email])
    
    //console.log("qui vedi:", user)
    console.log("Ecco i tuoi risultati:", risultati)
    res.json(risultati)
}
*/

export const aggiornaDatiPagamentoUtente =async (req: Request, res: Response) => {
    const { Numero_carta, Data_scadenza, CVV} = req.body
    const connection = await getConnection()
    //await connection.execute(`INSERT INTO tipo_pagamenti (Numero_carta, Data_scadenza, CVV) VALUES (?,?,?) WHERE idutente=?`, [Numero_carta, Data_scadenza, CVV, req.params.id])
    res.json({ message: "Pagamento effettuato, dati salvati"})
}   

