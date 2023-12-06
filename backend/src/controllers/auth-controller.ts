import { Request, Response } from "express";
import {getConnection} from "../utils/db"
import bcrypt from "bcrypt"
import { decodeAccessToken, deleteAccessToken, setAccessToken } from "../utils/auth";
//import { Connection } from "mysql2/promise";



export const register = async (req: Request, res: Response) => {
  //estrarre username (email) e password dal body
    const { email, password } = req.body
  //verificare che la mail sia disponibile
    const connection = await getConnection()
    const [users] = await connection.execute(`SELECT email FROM utente WHERE email=?`, [email])
    if (Array.isArray(users) && users.length > 0){
        res.status(400).send("Username già in uso")
        return
    }

    const passwordHash = await bcrypt.hash(password, 10)

    await connection.execute(`INSERT INTO utente (email, password) VALUES (?, ?)`, [email, passwordHash])
    const [result] = await connection.execute(`SELECT idutente, email, ruolo FROM utente WHERE email=?`, [email])

    const newUser = (result as any)[0]

    setAccessToken(req,res,newUser)

    res.json({message: "Registrazione effettuata"})
    
}

export const login = async (req: Request, res: Response) => {
    // Blocca la richiesta se l'utente ha già effettuato il login
    const user = decodeAccessToken(req, res)
    if (user) {
      res.status(403).send("Questa operazione richiede il logout.")
      return
    }
    console.log(req)
  
    // Estrae username e password dal body della richiesta
    const { email, password } = req.body
  
    // Esegue la query al database per ottenere i dati dell'utente in base allo username
    const connection = await getConnection()
    const [results]= await connection.execute(
      "SELECT idutente, email, password, ruolo FROM utente WHERE email=?",
      [email]
    )
  
    // Errore se l'utente non è stato trovato
    if (!Array.isArray(results) || results.length == 0) {
      res.status(400).send("Credenziali errate.")
      return
    }
  
    const userData = results[0] as any
  
    // Confronta l'hash della password fornita con quello nel database
    const passwordOk = await bcrypt.compare(password, userData.password)
  
    // Errore se la password è errata
    if (!passwordOk) {
      res.status(400).send("Credenziali sbagliate.")
      return
    }
  
    // Importante! Rimuove la password dall'oggetto utente
    delete userData.password
  
    // Crea un JWT contenente i dati dell'utente e lo imposta come cookie
    setAccessToken(req, res, userData)
    res.json({ message: "Login effettuato" })
}


export const logout = async (req: Request, res: Response) => {
  // Blocca la richiesta se l'utente non ha effettuato il login
  const user = decodeAccessToken(req, res)
  if (!user) {
    res.status(403).send("Questa operazione richiede l'autenticazione.")
    return
  }
  // Cancella il cookie contenente l'access token
  deleteAccessToken(req, res)
  res.json({ message: "Logout effettuato con successo" })
}


export const getProfile = async (req: Request, res: Response) => {
  // Decodifica il contenuto dell'access token, che contiene il dati dell'utente, e lo invia in risposta
  const user = decodeAccessToken(req, res)
  res.json(user)
}

/*

export const userRole = async (req: Request, res: Response) => {
  try {
    // Assuming you have a middleware or authentication logic to get the current user
    // For simplicity, this example assumes a user object is attached to the request
    //const currentUser: any = req['user']; // Assuming the user is attached to the request

    //if (!currentUser) {
      //res.status(401).json({ error: 'User not authenticated' });
      //return;
    //}
    const { email, password, ruolo } = req.body
    const connection = await getConnection();
    
    // Assuming your User entity has a "role" field
    const [user] = await connection.execute("SELECT ruolo FROM utente WHERE email=?", [email]);

    //if (user) {
      

      // Check the user role and redirect accordingly
      if (ruolo === 'amministratore') {
        res.json({ ruolo });
        // Redirect admin to the admin page
        res.redirect('/provaGiulia');
      } else if (ruolo === 'acquirente') {
        res.json({ ruolo });
        // Redirect user to the user page
        res.redirect("/PostiSala/:idproiezione");
      } else {
        // Handle other roles or invalid roles
        res.status(403).json({ error: 'Invalid user role' });
      }
      
  } catch (error) {
    console.error('Error fetching user role:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}
*/
