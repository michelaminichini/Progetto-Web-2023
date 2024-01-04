import { Request, Response } from "express";
import jwt from "jsonwebtoken"

interface User{
    idutente: number
    email: string // vale come username
    ruolo: "amministratore" | "acquirente"
}

const JWT_SECRET = "foo"
const COOKIE_NAME = "access-token"

// 3 funzioni di utility

export const setAccessToken = (req: Request, res: Response, user: any) => { // usato in fase di login e registrazione, codifica l'utente in un access token e lo imposta come cookie

    const accessToken = jwt.sign(user, JWT_SECRET, { // creato il token
        expiresIn: "1 day" // per quanto tempo l'utente rimane loggato
    })  

    res.cookie(COOKIE_NAME, accessToken, {
        maxAge: 86400000, // durata del cookie, quando il cookie viene cancellato in quel momento anche il token viene rimosso. Hanno dunque la stessa durata.  
        httpOnly: true,
        sameSite: true
    })
}

export const decodeAccessToken = (req: Request, res: Response) => {
    const accessToken = req.cookies[COOKIE_NAME] // prelevare l'access token dai cookie con una richiesta.cookies + notazione come un array tra [] a cui passare il cookie per ottenere il cookie contenente l'access token
    if (!accessToken) return null //se non c'è
    try {
        const user = jwt.verify(accessToken, JWT_SECRET) as User //voglio restituire l'utente
        return user
    }catch {
        return null
    }
}

export const deleteAccessToken = (req: Request, res: Response) => {
    res.clearCookie(COOKIE_NAME) // cancello il cookie
}