<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Prox} from "../types" //qui Prox si riferisce al tipo di interfaccia creata nel file types.ts

export default defineComponent({
    data(){
        return {
        prossimiFilm: [] as Prox[]
        }
    },
    methods: {
        getProssimiFilm(){
            axios.get("/api/prossimi-film").then(response => this.prossimiFilm = response.data)
        }
    },
    mounted(){
        this.getProssimiFilm()
   }

})


</script>


<template>
    <h1>Prossimamente...</h1>

    <body>
        <div id="app">
            <div v-for= "film in prossimiFilm" :key="film.id_film" class="cineContainer">
                <article>
                    <h2>{{ film.titolo_film }}</h2>
                    <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                    <p>Diretto da: {{ film.regista_film }}</p>
                    <p>Anno di uscita: {{ film.anno_uscita }}</p>
                    <p>Genere: {{ film.genere_film }}</p>
                    
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