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
        editingCell: null,
        rowIndex: null
        
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

        
        deleteFilm(rowIndex: any){
            axios.delete("/api/eliminazione/"+this.ListaFilm[rowIndex].idfilm)
            .then(response => 
            console.log("deleting film "+this.ListaFilm[rowIndex].idfilm))
            this.getLista()
            this.$forceUpdate()
        },

        editCell(rowIndex: any, cellIndex: any) {
            this.editingCell = `${rowIndex}-${cellIndex}`;
        },

        updateCell(rowI: any, cellI: any, v: string|number) {
            this.ListaFilm[rowI][cellI] = v;
        },

        finishEditing(rowIndex: number) {
            let riga = this.ListaFilm[rowIndex];
            this.editingCell = null;            
            axios.put("/api/aggiornamento",riga)
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
            <table id="tabella" class="table table-striped table-bordered">
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
                            <th style="width: 2%;">Trailer</th>
                            <th>Locandina</th>
                            <th>Lingua</th>
                            <th>Attori</th>
                            <th>Stato</th>
                            <th>Edita</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(film, rowIndex) in ListaFilm" :key="rowIndex">
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
                            <td>
                                <button @click="$emit('someEvent')" type="button" class="btn btn-success">
                                Edit   
                                </button>
                                <button @click="deleteFilm(rowIndex)" type="button" class="btn btn-danger">
                                Delete</button>
                            </td>
                        </tr>
                    </tbody>
            </table>
         </div>   
    </div>
</template>

<style scoped>
.card {
    margin-left: 5%;
    margin-right: 5%;
}

h1{
    margin:0;
    padding:0;
}

table{
    display: block;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    width: 100%;
}

td{
    max-width: 100px;
}
</style>
