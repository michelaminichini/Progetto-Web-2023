<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" //qui Film si riferisce al tipo di interfaccia creata nel file types.ts

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
    <body>
        <div id="app">
            <div v-for= "film in datiFilm" :key="film.idfilm" id="contenitore" class="cineContainer">
                <article>
                    <h2>{{ film.titolo }}</h2>
                    <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                    <table>
                        <tr>
                            <th>Diretto da</th>
                            <td>{{ film.regista }}</td>
                        </tr>
                        <tr>
                            <th>Anno di uscita</th>
                            <td>{{ film.anno }}</td>
                        </tr>
                        <tr>
                            <th>Genere</th>
                            <td>{{ film.genere }}</td>
                        </tr>
                        <tr>
                            <th>Durata</th>
                            <td>{{ film.durata }} min</td>
                        </tr>
                        <tr>
                            <th>Lingua</th>
                            <td>{{ film.lingua }}</td> 
                        </tr>
                    </table> 
                </article>
                <RouterLink :to="'/film/' + film.idfilm">Scheda Film</RouterLink>

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

#contenitore{
    margin-bottom: 3%;
    border-width: 10%;
    border-color: white;
}

table {
    display: inline;
    margin-left: 10%;
    width: 100%;
    margin-top: 0px;
}

td {
    width:150px;
    border: 2px solid white;
    padding: 2px;
    text-align: center;
}

th {
    background-color: transparent;
}
</style>