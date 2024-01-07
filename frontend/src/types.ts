export interface Film{
    idfilm: number
    titolo: string
    regista: string
    genere: string
    durata: number
    nazione: string
    anno: string
    descrizione: string
    trailer: string
    locandina: string
    lingua: string
    attori: string
    stato: number
    editing: {[ key: string] : boolean}
}

export interface FilmE{
    idfilm: string
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
    stato: string
    editing: {[ key: string] : boolean} 
    
}

export interface FilmEG{
    idfilm: string
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
    stato: number   
}

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

export interface SchedaEP{
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
    dataorap: string
}

export interface DataOra {
    datap: string
    orario: string
}

export interface Film_admin {
    titolo: string
    genere: string
    regista: string
    anno: number
}
  
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
    label: string
    selected: boolean
    numero: number
    occupato: boolean
    speciale: boolean
    costo: number
}

export interface Proiezione{
    idproiezione: number
    idfilm: number
    titolo: string
    idsala: number 
    datap: string
    orario: string
}

export interface postoF {
    fila: string
    numero: number
}

export interface PostoL {
    label: string,
    selected: boolean,
    occupato: boolean,
    costo:number
}

export interface User{
    idutente: number
    email: string
    password: string
    ruolo: "amministratore" | "acquirente"
}

export interface DatiUtente{
    idutente: number
    email: string
    password: string
    nome: string
    cognome: string
    telefono: string
    data_nascita: string
    ruolo: string
}

export interface CronoUtente{
    idutente: number
    idfilm: number
    titolo: string
    idbiglietto: number
    idtipo_pagamento1: number
    importo: number
    idproiezione: number
    idsala: number
    datap: string
    orario: string
    descrizione: string
    Descrizione: string
    Circuito: string
}

export interface UpdateUser{
    idutente:number
    nome:string
    cognome:string
    telefono:number
    data_nascita:string
}

export interface Tpag{
    idtipo_pagamento: number
    Descrizione: string
    Circuito: string
}

export interface Importo{
    costo: number
}

export interface TempPar{
    importo: number,
    posti: string,
    id_proiezione: number,
}

export interface DatiPagamento{
    idpagamento: string,
    tipo_pagamenti: string,           
    importo: string,
    nomeT :string,
    cognomeT: string,
    Numero_carta: string,
    Data_scadenza: string,
    CVV: string,
}

export interface Sale{
    idsala: number,
    descrizione: string,
    posti: number,
    posti_speciali: number,
    file: number,
    posti_fila: number,
    tecnologia: string,
}