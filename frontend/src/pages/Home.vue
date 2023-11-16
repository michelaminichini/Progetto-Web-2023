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
        this. getFilminLista()
   }
})

</script>

<template>
    <h1>Film in programmazione</h1>
    <article v-for="film in datiFilm">
        <h3>{{ film.titolo }}</h3>
        <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
        <p>regista: {{ film.regista }} - anno di uscita: {{ film.anno }}</p> 
        <p>attori: {{ film.attori }}</p>
        <p>genere: {{ film.genere }} - durata: {{ film.durata }} min</p>
        <p>luogo di produzione: {{ film.nazione }}</p>
        <p>Vedi trailer qui: {{ film.trailer }}</p>
        <p>Lingua: {{ film.lingua }}</p>
        <a href="#">Leggi tutto</a>
    </article>

</template>

