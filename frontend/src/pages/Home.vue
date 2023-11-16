<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" //qui Film si riferisce al tipo di interfaccia da creare in un file types.ts
//import listaFilm from "/pages/lists_of_films.php"

export default defineComponent({
    data(){
        return {
        datiFilm: [] as Film[]
        }
    },
    methods: {
        getFilminLista(){
            axios.get("/api/films").then(response => this.datiFilm = response.data)
        }
    },
    mounted(){
        this.getFilminLista()
   }

})


</script>

<template>
    <h1>Film in programmazione</h1>

    <body>
        <div id="app">
            <div v-for= "film in datiFilm" :key="film.idfilm" class="cineContainer">
                <div class="filmContainer">
                   <div class="locandina">
                        <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                        <article>
                            <h3>{{ film.titolo }}</h3>
                            <p>Diretto da: {{ film.regista }}</p>
                            <p>{{ film.descrizione }}</p>
                        </article>
                    </div>
                </div>

                
            </div>
        </div>

    </body>

</template>