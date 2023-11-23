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
    attivo: number
}

export interface Prox{
    id_film: number
    titolo_film: string
    regista_film: string
    genere_film: string
    anno_uscita: string
    descrizione: string
    trailer: string
    locandina: string
}

export interface SchedaF{
    idfilmF: number
    titoloF: string
    registaF: string
    genereF: string
    annoF: string
    descrizioneF: string
    locandinaF: string
    datap: string
    orario: string
}