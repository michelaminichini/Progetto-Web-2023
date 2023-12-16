import { Request, Response } from "express";
import {getConnection} from "../utils/db"
import { decodeAccessToken } from "../utils/auth";


export const updateData = async (req: Request, res: Response) => {
    //console.log('Update profile route reached');
    //const { email } = req.params;
    const { idutente, nome, cognome, telefono, data_nascita } = req.body
    console.log('Request body:', req.body) // appurato che viene stampato in console

    console.log("ID"+ idutente)
    const connection = await getConnection()
    const [risultati] = await connection.execute(`UPDATE utente SET nome=?, cognome=?, telefono=?, data_nascita=? WHERE idutente=?`, [nome, cognome, telefono, data_nascita, idutente])
    
    //console.log("qui vedi:", user)
    console.log("Ecco i tuoi risultati:", risultati)
    res.json(risultati)
}

 export const aggiornaDatiPagamentoUtente =async (req: Request, res: Response) => {
     const {idbiglietto, tipo_pagamenti, importo, Numero_carta, Data_scadenza, CVV} = req.body
     const connection = await getConnection()
     await connection.execute(`INSERT INTO pagamenti (Importo, Numero_carta, Data_scadenza, CVV) VALUES (?,?,?,?)`,
     //INSERT INTO pagamenti (idbiglietto1,idtipo_pagamento1,Importo, Numero_carta, Data_scadenza, CVV) VALUES (10,1,10.5,'1234','2024-01-01',388);
     [idbiglietto, tipo_pagamenti, importo, Numero_carta, Data_scadenza, CVV])
     res.json({ message: "Pagamento effettuato, dati salvati"})
 }  
 
 export const leggiDatiProfiloPersonale =async (req: Request, res: Response) => {
    const connection = await getConnection()
    const [results] = await connection.execute(`SELECT * FROM utente WHERE idutente = ?`,
    [req.params.id],   
    )
    res.json(results)   
}  

export async function aggiornaDatiProfilo(req: Request, res: Response) {
    const {idutente, email, password, nome, cognome, telefono, data_nascita, ruolo} = req.body[0]
    console.log(idutente)
    console.log(req.body)
    const connection = await getConnection()
    const [result] = await connection.execute(`UPDATE utente SET nome=?, cognome=?, telefono=?, data_nascita=? WHERE idutente=?`,
    [nome, cognome, telefono, data_nascita, idutente],)
    //res.json({message: "Profilo aggiornato"+result})
    res.json({result})
}
 


