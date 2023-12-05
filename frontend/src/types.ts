export interface Film{
    idfilm: number
    titolo: string
    regista: string
    genere: string
    durata: string
    nazione: string
    anno: string
    descrizione: string
    trailer: string
    locandina: string
    lingua: string
    attori: string
    attivo: number
    editing: {[ key: string] : boolean}
}

/* export interface Prox{
    id_film: number
    titolo_film: string
    regista_film: string
    genere_film: string
    anno_uscita: string
    descrizione: string
    trailer: string
    locandina: string
} */

export interface SchedaF{
    idfilm: number
    titolo: string
    regista: string
    genere: string
    anno: string
    descrizione: string
    locandina: string
    idproiezione: number
    datap: string
    orario: string
}

export interface DataOra {
    datap: string
    orario: string
}

export interface Film_admin {
    //locandina:;
    titolo: string
    genere: string
    regista: string
    anno: number
  }
  
/*   export interface FilmResponse {
    data: Film_admin[];
  } */
  
export interface IDproiezioneSB {
    idproiezione: number
}

export interface IDsala {
    idsala: number
    fila: number
    posti_fila: number
}

export interface posto {
    idposto: number
    idproiezione: number
    fila: string
    numero: number
    occupato: boolean
    speciale: boolean
}

export interface User{
    idutente: number
    email: string
    password: string
    ruolo: "amministratore" | "acquirente"
}