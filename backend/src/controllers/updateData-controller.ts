import { Request, Response } from "express";
import {getConnection} from "../utils/db"

/*
// Gestione dati riguardanti il pagamento. Inserimento dati immessi dall'utente nel database locale
export const aggiornaDatiPagamentoUtente =async (req: Request, res: Response) => {
     const {idbiglietto, tipo_pagamenti, importo, Numero_carta, Data_scadenza, CVV} = req.body
     const connection = await getConnection()
     await connection.execute(`INSERT INTO pagamenti (Importo, Numero_carta, Data_scadenza, CVV) VALUES (?,?,?,?)`,
     //INSERT INTO pagamenti (idbiglietto1,idtipo_pagamento1,Importo, Numero_carta, Data_scadenza, CVV) VALUES (10,1,10.5,'1234','2024-01-01',388);
     [idbiglietto, tipo_pagamenti, importo, Numero_carta, Data_scadenza, CVV])
     res.json({ message: "Pagamento effettuato, dati salvati"})
}  
*/
export const aggiornaDatiPagamentoUtente =async (req: Request, res: Response) => {
   try {
    const {Numero_carta, Data_scadenza, CVV} = req.body
    const idutente = req.params.id
    const connection = await getConnection()

    //const [userResult] = await connection.execute(`SELECT idutente FROM utente WHERE idutente = ?`, [req.params.id]);

    //if (Array.isArray(userResult) && userResult.length > 0){
        await connection.execute(`INSERT INTO pagamenti (Numero_carta, Data_scadenza, CVV) VALUES (?,?,?)`,
        [Numero_carta, Data_scadenza, CVV])
        res.json({ message: "Pagamento effettuato, dati salvati" });
    //} else {
      //res.status(404).json({ error: "User not found or condition not met" });
    //}
   } catch (error) {
    console.error('Error inserting payment:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
    //res.json({ message: "Pagamento effettuato, dati salvati"})
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
    res.json({result})
}
 


