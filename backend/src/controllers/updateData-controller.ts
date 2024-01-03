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
    const {tipo_pagamenti,importo,nomeT,cognomeT,Numero_carta, Data_scadenza, CVV} = req.body
    //const idutente = req.params.id
    const connection = await getConnection()

    //const [userResult] = await connection.execute(`SELECT idutente FROM utente WHERE idutente = ?`, [req.params.id]);
    //if (Array.isArray(userResult) && userResult.length > 0){

        await connection.execute(`INSERT INTO pagamenti (idtipo_pagamento1,Importo,titolare_nome,Titolare_cognome, Numero_carta, Data_scadenza, CVV) VALUES (?,?,?,?,?,?,?)`,
        [tipo_pagamenti,importo,nomeT,cognomeT,Numero_carta, Data_scadenza, CVV]),
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
// Nella pagina del profilo dell'utente, premendo la prima icona, l'utente visualizza i propri dati personali e, successivamente, può scegliere se modificarli (query successiva)
export const leggiDatiProfiloPersonale =async (req: Request, res: Response) => {
    const connection = await getConnection()
    const [results] = await connection.execute(`SELECT * FROM utente WHERE idutente = ?`,
    [req.params.id],   
    )
    res.json(results)   
}  
// Nella pagina del profilo dell'utente, premendo la prima icona, l'utente può decidere di modificare i campi presenti
export async function aggiornaDatiProfilo(req: Request, res: Response) {
    const {idutente, email, password, nome, cognome, telefono, data_nascita, ruolo} = req.body[0]
    console.log(idutente)
    console.log(req.body)
    const connection = await getConnection()
    const [result] = await connection.execute(`UPDATE utente SET nome=?, cognome=?, telefono=?, data_nascita=? WHERE idutente=?`,
    [nome, cognome, telefono, data_nascita, idutente],)
    res.json({result})
}
// Nella pagina Pagamento, tutti i dati della tabella "tipo_pagamenti" vengono selezionati e visualizzati nel menù a tendina presente nella pagina 
export const leggiTipoPag = async (req: Request, res: Response) => {
  const connection = await getConnection()
  const [results] = await connection.execute(`SELECT * FROM tipo_pagamenti`)
  res.json(results)   
}  
