<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {FilmE} from "../types" // tipo di interfaccia creata nel file types.ts
//import { Modifica } from "../types"

interface EditingCell{
    rowIndex: number
    field: keyof FilmE
}

export default defineComponent({
    data(){
        return {
        ListaFilm: [] as FilmE [],
        //EditedFilm: [] as Film [],
        editingCell: null
        
    }
    },
    methods: {
        getLista() {
            axios.get("/api/tuttifilm").then(response => this.ListaFilm = response.data)
        },

        addFilm() {
            axios.post("/api/inserimento")
            .then(response => {console.log(response.data)})
            this.getLista()
            this.$forceUpdate()
        },

        updateFilm(){
        },

        editCell(rowIndex, cellIndex) {
            this.editingCell = `${rowIndex}-${cellIndex}`;
        },

        updateCell(rowI, cellI, v: string|number) {
            this.ListaFilm[rowI][cellI] = v;
        },

        finishEditing(rowIndex) {
            let idf = rowIndex+1;
            let riga = this.ListaFilm[rowIndex];
            let rtitolo = riga.titolo;
            let rregista = riga.regista;
            let rgenere = riga.genere;
            let rdurata = riga.durata;
            let rnazione = riga.nazione;
            let ranno = riga.anno;
            let rdescrizione = riga.descrizione;
            let rtrailer = riga.trailer;
            let rlocandina = riga.locandina;
            let rlingua = riga.lingua;
            let rattori = riga.attori;
            let rstato = riga.stato;

            this.editingCell = null;
            axios.post("/api/aggiornamento/",{params: {
                rtitolo,
                rregista,
                rgenere,
                rdurata,
                rnazione,
                ranno,
                rdescrizione,
                rtrailer,
                rlocandina,
                rlingua,
                rattori,
                rstato,
                idf,
                }
            })
            .then(response => {console.log(response.data)})
            console.log("/api/aggiornamento/"+ (rowIndex+1));
            console.log(this.ListaFilm[rowIndex]);
        },

       
    },
    mounted() {
    this.getLista()
  }
})


</script>
<template>
    <h1>
        prova Giulia
    </h1>

    <div class="card">
        <div class="card-header">
            <h4>Lista films
                <button @click="addFilm()" type="button" class="btn btn-primary float-end">
                    Aggiungi
                </button>
            </h4>
        </div>
    
        <div class="card-body">
            <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Titolo</th>
                            <th>Regista</th>
                            <th>Genere</th>
                            <th>Durata</th>
                            <th>Nazione</th>
                            <th>Anno</th>
                            <th>Descrizione</th>
                            <th>Trailer</th>
                            <th>Locandina</th>
                            <th>Lingua</th>
                            <th>Attori</th>
                            <th>Stato</th>
                            <th>Edita</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(film, rowIndex) in ListaFilm" :key="rowIndex">
                            <!-- <td>{{ film.idfilm }}</td> -->
                            <td v-for="(cell, cellIndex) in film" :key="cellIndex" @click="editCell(rowIndex, cellIndex)">
                                <template v-if="editingCell === `${rowIndex}-${cellIndex}`">
                                <input
                                    type="text"
                                    :value="cell"
                                    @input="updateCell(rowIndex, cellIndex, $event.target.value)"
                                    @blur="finishEditing(rowIndex)"
                                />
                                </template>
                                <template v-else>
                                {{ cell }}
                                </template>
                            </td>


                            <!-- <td>{{ film.titolo }}</td> 
                            <td>{{ film.regista }}</td>
                            <td>{{ film.genere }}</td>
                            <td>{{ film.durata }}</td>
                            <td>{{ film.nazione }}</td>
                            <td>{{ film.anno }}</td>
                            <td>{{ film.stato }}</td>-->
                            <td>
                                <button @click="$emit('someEvent')" type="button" class="btn btn-success">
                                Edit   
                                </button>
                                <button type="button" class="btn btn-danger">
                                Delete</button>
                            </td>
                        </tr>
                    </tbody>
            </table>
         </div>   
    </div>
</template>

