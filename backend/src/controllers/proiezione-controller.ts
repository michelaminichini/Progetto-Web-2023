import { Request, Response } from "express";
import { getConnection } from "../utils/db"


export async function proiezioneX(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT idproiezione FROM proiezioni`,
        [],
    )
    res.json(results)
}

export async function salaX(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT sale.idsala, sale.fila, sale.posti_fila FROM sale JOIN proiezioni ON sale.idsala = proiezioni.idsala WHERE idproiezione = ?`,
        [req.params.id],
    )
    res.json(results)
}

export async function postiF(req:Request, res:Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `SELECT label,selected,occupato,costo FROM posti_proiezione WHERE idproiezione = ?`, 
        [req.params.id],
    )
    res.json(results)
}
// Aggiorna lo stato del sedile prenotato dall'utente
export async function aggiornaPostoPF(req:Request, res: Response) {
    const {idproiezione, label} = req.body
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `UPDATE posti_proiezione SET occupato = 1 WHERE idproiezione = ? AND label = ?`,
        [idproiezione,label]
    )
    res.json(results)
}



export const idnuovaproj =async (req: Request, res: Response) => {
    const connection = await getConnection()
    const [results] = await connection.execute(`SELECT idproiezione FROM proiezioni WHERE idproiezione=(SELECT MAX(idproiezione) FROM proiezioni)`,
       
  )
    res.json(results)   
}  

export async function aggiornaPostiProj(req: Request, res: Response) {
    console.log('Sala PP: ',req.params.ids)
    const connection = await getConnection()
    const [result] = await connection.execute(`INSERT INTO posti_proiezione(label, fila, numero, speciale) SELECT label, fila, numero, speciale FROM sale_layout WHERE idsala=?`,
    [req.params.ids])
    res.json({result})
}

export async function aggiornaIdProj(req: Request, res: Response) {
    console.log(req.params.idp)
    const connection = await getConnection()
    const [result] = await connection.execute(`UPDATE posti_proiezione SET idproiezione=? WHERE idproiezione=0`,
    [req.params.idp])
    res.json({result})
}

export async function nuovaProiezione(req:Request, res: Response) {
    const {idfilm,idsala,datap,orariop} = req.body
    console.log(req.body)
    const connection = await getConnection()
    const [results] = await connection.execute(
        `INSERT INTO proiezioni (idfilm, idsala, datap, orario) VALUES (?,?,?,?)`,
        [idfilm,idsala,datap,orariop]
    )
    res.json(results)
}

// Cancellazione riga di una proiezione dalla tabella admin2 - operazione solo per amministratori
export async function deleteProj(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `DELETE FROM proiezioni WHERE idproiezione=?`,
        [req.params.id],
    )
    res.json(results)
}

// Cancellazione riga di una proiezione dal secondo pannello admin - operazione solo per amministratori
export async function cancellaDati(req:Request, res: Response) {
    const connection = await getConnection()
    const [results] = await connection.execute(
        `DELETE FROM proiezioni WHERE idproiezione=?`,
        [req.params.id],
    )
    res.json(results)
}

