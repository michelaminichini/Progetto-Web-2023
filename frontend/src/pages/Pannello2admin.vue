<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {FilmE, Proiezione, SchedaF} from "../types" // tipo di interfaccia creata nel file types.ts
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
        listaInfo: [] as SchedaF[],
        editingCell: null,
        rowIndex: null,
        editmode: false,
        proiezioni: [] as Proiezione[],
        
    }
    },
    methods: {
        // Prende e visualizza nella tabella tutti i dati
        getInfo() {
            axios.get("/api/infoToUpdate").then(response => this.listaInfo = response.data)
            
        },
        // Aggiunge una riga in fondo alla tabella 
        addDati() {
            axios.post("/api/nuovi-dati")
            .then(response => {console.log(response.data)})
            this.getInfo()
            this.$forceUpdate()
        },
        // Elimina una riga dalla tabella
        deleteData(rowIndex: any){
            axios.delete("/api/cancella-dati"+this.proiezioni[rowIndex].idproiezione)
            .then(response => 
            console.log("deleting data "+this.proiezioni[rowIndex].idproiezione))
            this.getInfo()
            this.$forceUpdate()
        },

        editCell(rowIndex: any, cellIndex: string) {
            this.editingCell = `${rowIndex}-${cellIndex}`;
        },

        updateCell(rowI: number, cellI: number, v: string|number) {
            this.ListaFilm[rowI][cellI] = v;
        },
        // Aggiorna i dati sul database terminando l'operazione di edit
        finishEditing(rowIndex: number) {
            let riga = this.proiezioni[rowIndex];
            this.editingCell = null;            
            axios.put("/api/aggiorna-dati",riga)
            .then(response => {console.log(response.data)})
            console.log("/api/aggiorna-dati"+ (rowIndex+1));
            console.log(this.proiezioni[rowIndex]);
        },

        edit: function() {g
            this.editmode = !this.editmode;
        },
    },
    mounted() {
    this.getInfo()
    
  }
})


</script>

<template>
    
    <h1>
        Secondo pannello di controllo
    </h1>

    <div class="card">
        <div class="card-header">
            <h4>Dettagli films
                <button @click="addDati()" type="button" class="btn btn-primary float-end">
                    Aggiungi
                </button>
            </h4>
        </div>
    
        <div class="card-body">
            <table id="tabella" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID Film</th>
                            <th>Titolo</th>
                            <th>Idproiezione</th>
                            <th>IdSala</th>
                            <th>Data Proiezione</th>
                            <th>Orario</th>
                            <th>Edita</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(film, rowIndex) in listaInfo" :key="rowIndex">
                            <td v-for="(cell, cellIndex) in film" :key="cellIndex">
                                <template v-if="editingCell === `${rowIndex}-${cellIndex}`">
                                <input
                                    v-if="editmode"
                                    id="myInput"
                                    type="text"
                                    :value="cell"
                                    @input="updateCell(rowIndex, cellIndex, $event.target.value)"
                                    @blur="finishEditing(rowIndex)"
                                />
                                </template>
                                <template v-else>
                                {{ cell }}
                                </template>

                                <td>
                                    <button @click="editCell(rowIndex, cellIndex)" v-on:click="edit()"  type="button" class="btn btn-success" style="display: block;">
                                    Edit   
                                    <!-- {{ editingCell === `${rowIndex}-${cellIndex}` ? "Save" : "Edit" }} TRASFORMA EDIT IN SAVE QUANDO VIENE PREMUTO, POI VICEVERSA-->
                                    </button>
                                    <!--button onclick="document.getElementById('myInput').value ='' ">Clear</button-->
                                </td>
                            </td>
                            <td>
                                
                                <button @click="deleteData(rowIndex)" type="button" class="btn btn-danger">
                                    Delete
                                </button>
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
    margin:2%;
    padding:0;
    color: white;
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
