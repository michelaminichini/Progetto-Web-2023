# Progetto-Web-2023

## Table of Contents

- [Introduzione](#introduzione)
- [Features](#features)
- [Tecnologie utilizzate](#tecnologie-utilizzate)
- [Pacchetti Installati](#pacchetti-installati)
- [Struttura del progetto](#struttura-del-progetto)
- [Installazione](#installazione)
- [API Endpoints](#api-endpoints)
- [Database](#database)
- [Color Accessibility](#color-accessibility)
- [Documentazione](#documentazione)

  ## Introduzione

Benvenuti nel sito ufficiale GalaxyCineVerse! 
Questa applicazione web permette agli utenti di visionare una lista di film disponibili, selezionare quello che più interessa visionando i relativi dettagli come data e orario, per poi proseguire con la prenotazione di un posto e l'acquisto di un biglietto.
Una volta scelto, l'utente può procedere ad effettuare il login al suo account personale per poter finalizzare il pagamento e acquistare definitivamente un biglietto.

Se invece ad effettuare il login è l'amministratore, allora sarà disponibile una seconda versione dell'applicazione in cui sarà possibile modificare i campi presenti, come per esempio i film disponibili, gli orari e le date.

## Features

- Esplora il sito alla ricerca di un film. Una volta deciso quale si preferisce, clicca su "scheda film" per selezionare una data e un orario.
- Scegli un posto a sedere e acquista un biglietto una volta effettuato il login al tuo account personale
- Puoi verificare il tuo profilo nell'apposita sezione. Premi su "login" una volta effettuato l'accesso
- Non hai ancora un account? Crealo in pochi e semplici passi riempiendo le caselle presenti nella sezione "registrati"
- Responsive design per tutti i devices

## Tecnologie utilizzate

- XAMPP control panel (per poter avviare MySQL e accedere al database e Apache per avviare il web server)
- Node.js (prerequisito)
- npm
- Vue.js
- Vite
- Vue Router
- Axios
- TypeScript
- Express (e mysql2)
- Estensione Volar per Visual Studio Code
- Bootstrap e SASS (SCSS) per la gestione dello stile

## Pacchetti Installati

- connect-history-api-fallback (installato nel backend con il comando " npm i connect-history-api-fallback")
- cookie-parser, jsonwebtoken e bcrypt per tutto ciò che riguarda la protezione delle password. Insieme ad essi, sono stati installati i rispettiti "types" con il comando "@types/nome-pacchetto". Ognuno ha dunque le proprie dichiarazioni TypeScript (TS declarations) messe a disposizione dal comando nominato in precedenza.
- body-parser (Middleware di parsing del corpo di Node.js. Analizza i corpi delle richieste in arrivo in un middleware prima dei gestori, disponibile sotto la proprietà req.body.) Anch'esso ha le sue dichiarazioni TypeScript messe a disposizione dal comando "@types/nome-pacchetto".

## Struttura del progetto

- Backend realizzato con Express (e Mysql) e TypeScript
- Frontend sfrutta Vite, Vue, Axios e TypeScript. Cartella "frontend" realizzata con Vite

## Installazione

1) Clona il repository: 
Nella bash
   " git clone https://github.com/michelaminichini/Progetto-Web-2023.git
   cd Progetto-Web-2023 "

2) Installare le dipendenze in entrambe le cartelle frontend e backend con il comando " npm i"; eseguire il comando in ciascuna cartella eseguendo prima il comando " cd frontend " poi " cd backend "

3) Eseguire l'applicazione web con il comando " npm run dev" in ciascuna cartella come specificato sopra. Una volta fatto ciò, visitare il link che viene mostrato per accedere all'app.

## API Endpoints

## Database

Per realizzare questa applicazione web abbiamo creato un database denominato "cinema" su https://www.phpmyadmin.net/ .
Il database consente di visualizzare tutti i dati relativi ai film disponibili come il titolo, la locandina e molto altro.
I dati vengono letti dal database e visualizzati correttamente grazie alla connessione stabilita nel file "db.ts" collocato all'interno della cartella "utils" nella cartella "src" del backend.
Esso è composto di 9 diverse tabelle ciascuna con i propri attributi e collegate tra loro mediante "foreign key". Infine, è usato per immagazzinare tutti i dati degli utenti in totale sicurezza.

## Color accessibility


## Documentazione

- https://www.npmjs.com/ per la ricerca dei pacchetti installati all'interno del progetto
- materiale didattico universitario
