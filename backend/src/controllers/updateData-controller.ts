import { Request, Response } from "express";
import {getConnection} from "../utils/db"

export const updateData = async (req: Request, res: Response) => {
    //console.log('Update profile route reached');
    const { email, nome, cognome, telefono, data_nascita } = req.body
    console.log('Request body:', req.body)

    const connection = await getConnection()
    const [users] = await connection.execute(`SELECT email FROM utente WHERE email=?`, [email])
    // Errore se l'utente non è stato trovato
    if (!Array.isArray(users) || users.length == 0) {
        res.status(400).send("Credenziali errate.")
        return
    }

    const user = users[0] as any

    await connection.execute(`UPDATE utente SET nome=?, cognome=?, telefono=?, data_nascita=? WHERE email=?`, [nome, cognome, telefono, data_nascita, user.email])
    
    console.log("UTENTE QUI:", user)
    res.json(user)
}

