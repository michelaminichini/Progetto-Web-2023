<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" // tipo di interfaccia creata nel file types.ts

export default defineComponent({
    data(){
        return {
        ListaFilm: [] as Film [],
        editingCell: "",
        rowIndex: null,
        editmode: false,
        statoFilm:[
            'nd',
            'attivo',
            'prox'
        ],        
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

        editCell(rowIndex: any, cellIndex: string){
            console.log(this.editmode)
            this.editingCell = `${rowIndex}-${cellIndex}`;
        },

        finishEditing(rowIndex: number) {
            console.log(this.editmode)
            let riga = this.ListaFilm[rowIndex];
            this.editingCell = "";            
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
        Pagina Amministratore - pannello di controllo
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
                                {{ statoFilm[film.stato] }}
                            </td>

                            <td>       
                                <button @click="editFilm(rowIndex)" id="edit" type="button" class="btn" style="display: block;">
                                Edit   
                                </button>
                                <button @click="deleteFilm(rowIndex)" id="delete" type="button" class="btn">
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

#edit, #delete{
    background-color: rgb(66, 65, 65);
    color: white;
    border-color: black;
}

#edit:hover, #delete:hover{
    color:black;
    background-color: rgb(255, 255, 71);
}

</style>
