<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" //qui Film si riferisce al tipo di interfaccia da creare in un file types.ts

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
                <article>
                    <h2>{{ film.titolo }}</h2>
                    <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                        <p>Diretto da: {{ film.regista }}</p>
                        <p>Anno di uscita: {{ film.anno }}</p>
                        <p>Genere: {{ film.genere }}</p>
                        <p>Durata: {{ film.durata }} min</p>
                        <p>Lingua: {{ film.lingua }}</p>
                </article>
                
            </div>
        </div>

    </body>

</template>

<style scoped>
h1{
    color:aliceblue;
    margin-left: 10%;
}

article {
    color:aliceblue;
}

#app{
    margin-left: 10%;
}

</style>