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
        rowIndex: null,
        editmode: false,
        
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
        
        deleteFilm(rowIndex: any){
            axios.delete("/api/eliminazione/"+this.ListaFilm[rowIndex].idfilm)
            .then(response => 
            console.log("deleting film "+this.ListaFilm[rowIndex].idfilm))
            this.getLista()
            this.$forceUpdate()
        },

        editCell(rowIndex: any, cellIndex: string) {
            console.log(this.editmode)
            this.editingCell = `${rowIndex}-${cellIndex}`;
        },

        updateCell(rowI: number, cellI: number, v: string|number) {
            this.ListaFilm[rowI][cellI] = v;
        },

        finishEditing(rowIndex: number) {
            //this.editmode = false;
            console.log(this.editmode)
            let riga = this.ListaFilm[rowIndex];
            this.editingCell = null;            
            axios.put("/api/aggiornamento",riga)
            .then(response => {console.log(response.data)})
            console.log("/api/aggiornamento/"+ (rowIndex+1));
            console.log(this.ListaFilm[rowIndex]);
        },

        edit: function() {
            this.editmode = !this.editmode;
            console.log(this.editmode)
        },

        editFilm(rowIndex: any){
            console.log(rowIndex)
            const idfilm = this.ListaFilm[rowIndex].idfilm;
            this.$router.push('/editfilm/'+idfilm)

        },

        redirect(){
            //window.location.href = "/pannello2"
            this.$router.push('/pannello2')
        }
       
    },
    mounted() {
    this.getLista()
    
  }
})


</script>

<template>
    
    <h1>
        Pagina Amministratore G - pannello di controllo
    </h1>

    <div class="card">
        <div class="card-header">
            <h4>Lista films
                <button @click="addFilm()" type="button" class="btn btn-primary float-end">
                    Aggiungi
                </button>
                <button id="secondo-pannello-up" @click="redirect()" type="button" class="btn btn-primary float-end">
                    Vai a pannello 2
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
                            <th>Stato</th>
                            <th>Funzione</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(film, rowIndex) in ListaFilm" :key="rowIndex">
                            <td>
	                            {{ film.idfilm }}
                            </td>
                            <td>
                                {{ film.titolo }}
                            </td>
                            <td>
                                {{ film.regista }}
                            </td>
                            <td>
                                {{ film.genere }}
                            </td>
                            <td>
                                {{ film.durata }}
                            </td>
                            <td>
                                {{ film.nazione }}
                            </td>
                            <td>
                                {{ film.anno }}
                            </td>
                            <td>
                                {{ film.stato }}
                            </td>

                            <td>       
                                <button @click="editFilm(rowIndex)" type="button" class="btn btn-success" style="display: block;">
                                Edit   
                                </button>
                                <button @click="deleteFilm(rowIndex)" type="button" class="btn btn-danger">
                                Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
            </table>
         </div>   
    </div>

    <div>
        <button id="secondo-pannello" @click="redirect()">Passa a pannello 2</button>
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

#secondo-pannello{
    display: block;
    margin: 0 auto;
    margin-top: 5%;
    width:300px;
    height: 50px;
}
</style>
