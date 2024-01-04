import { Request, Response } from "express";
import {getConnection} from "../utils/db"


export const aggiornaDatiPagamentoUtente = async (req: Request, res: Response) => {
   try {
    const {tipo_pagamenti,importo,nomeT,cognomeT,Numero_carta, Data_scadenza, CVV} = req.body
    
    console.log(req.body)
    const connection = await getConnection()

        await connection.execute(`INSERT INTO pagamenti (idtipo_pagamento1,importo,Titolare_nome,Titolare_cognome, Numero_carta, Data_scadenza, CVV) VALUES (?,?,?,?,?,?,?)`,
        [tipo_pagamenti,importo,nomeT,cognomeT,Numero_carta, Data_scadenza, CVV]),
        res.json({ message: "Pagamento effettuato, dati salvati" });

    
   } catch (error) {
    console.error('Error inserting payment:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
    
} 

export const leggiDatiPagamento =async (req: Request, res: Response) => {
  const connection = await getConnection()
  const [results] = await connection.execute(`SELECT * FROM pagamenti WHERE idpagamento=(SELECT MAX(idpagamento) FROM pagamenti)`,
     
)
  res.json(results)   
}  

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

export async function aggiornaDatiTicket(req: Request, res: Response) {
  const {idutenteT, idproj, idpag, posti} = req.body
  console.log("QQQ")
  console.log(req.body)
  const connection = await getConnection()
  const [result] = await connection.execute(`INSERT INTO biglietti  (idutente, idproiezione1, idpagamento1, idposto1) VALUES (?,?,?,?)`,
  [idutenteT, idproj, idpag, posti],)
  res.json({result})
}