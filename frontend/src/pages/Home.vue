<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types"

export default defineComponent({
    data(){
        return {
        datiFilm: [] as Film[]
        }
    },
    methods: {
        getFilminLista(){
            axios.get("/api/films").then(response => {this.datiFilm = response.data; console.log(this.datiFilm)})
            
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
                            <th>Genere</th>
                            <td>{{ film.genere }}</td>
                        </tr>
                        <tr>
                            <th>Anno di uscita</th>
                            <td>{{ film.anno }}</td>
                        </tr>
                        <tr>
                            <th>Durata</th>
                            <td>{{ film.durata }} min.</td>
                        </tr>
                        <tr>
                            <th>Trama</th>
                            <td>{{ film.descrizione }}</td> 
                        </tr>
                        <tr>
                            <th>Attori principali</th>
                            <td>{{ film.attori }}</td> 
                        </tr>
                        <tr>
                            <th>Lingua</th>
                            <td>{{ film.lingua }}</td> 
                        </tr>
                    </table> 
                </article>
                <RouterLink :to="'/film/' + film.idfilm" style="color: white; font-size:large">Scheda Film</RouterLink>

            </div>
        </div>
    </body>
</template>

<style scoped>


body > div > div > article > h2{
    padding:2%;
    margin:0;
}

article {
    color:aliceblue;
}

#app{
    margin-left: 10%;
}

table {
    display: inline;
    margin-left: 5%;
    width: 50%;
    border-collapse: collapse;
}

td {
    width:700px;
    border: 2px solid white;
    padding: 2px;
    text-align: center;
}

th {
    background-color: transparent;
}


@media only screen and (max-width: 600px) {
    th, td {
      display: block;
      width: 100%;
      box-sizing: border-box;
    }

    th {
      text-align: left;
      background-color:transparent;
    }
}
</style>
