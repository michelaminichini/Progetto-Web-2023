<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" // tipo di interfaccia creata nel file types.ts
//import { Modifica } from "../types"

interface EditingCell{
    rowIndex: number
    field: keyof Film 
}

export default defineComponent({
    data(){
        return {
        ListaFilm: [] as Film [],
        EditedFilm: [] as Film []
        
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
        }
        

       
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
                            <th>Stato</th>
                            <th>Edita</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(film, index) in ListaFilm" :key="index">
                            <td>{{ film.idfilm }}</td>
                            <td>{{ film.titolo }}</td>
                            <td>{{ film.regista }}</td>
                            <td>{{ film.genere }}</td>
                            <td>{{ film.durata }}</td>
                            <td>{{ film.nazione }}</td>
                            <td>{{ film.anno }}</td>
                            <td>{{ film.attivo }}</td>
                            <td>
                                <button type="button" class="btn btn-success">
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

