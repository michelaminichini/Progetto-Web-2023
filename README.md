# Progetto-Web-2023

## Table of Contents

- [Introduzione](#introduzione)
- [Features](#features)
- [Prerequisiti](#prerequisiti)
- [Tecnologie utilizzate](#tecnologie-utilizzate)
- [Pacchetti Installati](#pacchetti-installati)
- [Struttura del progetto](#struttura-del-progetto)
- [Installazione](#installazione)
- [API Endpoints](#api-endpoints)
- [Database](#database)
- [Color Accessibility](#color-accessibility)

  ## Introduzione

Benvenuti nel sito ufficiale GalaxyCineVerse! 
Questa applicazione web permette agli utenti di visionare una lista di film disponibili, selezionare quello che più interessa visionando i relativi dettagli come data e orario, per poi proseguire con la prenotazione di un posto e l'acquisto di un biglietto.
Una volta riempiti tutti i campi in cui selezionare un film, l'utente può procedere ad effettuare il login al suo account personale per poter 
finalizzare il pagamento e acquistare definitivamente un biglietto.

Se invece ad effettuare il login è l'amministratore, allora sarà disponibile una seconda versione dell'applicazione in cui sarà possibile modificare i campi presenti, come per esempio i film disponibili, gli orari e le date.

## Features

- Esplora il sito alla ricerca di un film scegliendo data e orario
- Per aiutarti nella scelta del film che più ti piace, naviga tra le varie sezioni dedicate in cui potrai scoprire i dettagli
- Scegli un posto a sedere e acquista un biglietto una volta effettuato il login al tuo account personale
- Responsive design per tutti i devices

## Prerequisiti

- XAMPP control panel
- Node.js
- npm
- Vue
- TypeScript
- Express (e mysql2)
- Estensione Volar per Visual Studio Code
- (optional) PHP
- Bootstrap

## Tecnologie utilizzate

- Node.js
- Express.js
- Vue.js
- Vite
- TypeScript
- Vue Router
- Axios
- XAMPP control panel per poter avviare MySQL e accedere al database e Apache per avviare il web server
- Bootstrap per la realizzazione dello stile dell'applicazione web insieme a Strass (SCSS)

## Pacchetti Installati

- connect-history-api-fallback (installato nel backend con il comando " npm i connect-history-api-fallback")

## Struttura del progetto

- Backend realizzato con Express (e Mysql) e TypeScript
- Frontend sfrutta Vue, Vite, Axios e TypeScript. Cartella "frontend" realizzata con Vite

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
Esso è composto di 9 diverse tabelle ciascuna con i propri attributi e collegate tra loro mediante "foreign key".

I dati vengono letti dal database e visualizzati correttamente grazie alla connessione stabilita nel file "bd.ts" collocato all'intenro della cartella "utils" nella cartella "src" del backend.

## Color accessibility

