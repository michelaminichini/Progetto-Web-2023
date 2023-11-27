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
                    <table>
                        <tr>
                            <th>Diretto da</th>
                            <td>{{ film.regista_film }}</td>
                        </tr>
                        <tr>
                            <th>Anno uscita</th>
                            <td>{{ film.anno_uscita }}</td>
                        </tr>
                        <tr>
                            <th>Genere</th>
                            <td>{{ film.genere_film }}</td>
                        </tr>
                    </table>  
                </article>
            
            </div>
        </div>

    </body>

</template>


<style scoped>
h1{
    color:aliceblue;
    margin-top:2%;
    margin-bottom:3%;
}

body > div > div > article > h2{
    margin:0;
    margin-bottom:2%;
}

article {
    color:aliceblue;
    margin-bottom: 5%;
}

#app{
    margin-left: 10%;
}

table {
    display: inline;
    margin-left: 10%;
    width: 100%;
    margin-top: 0px;
}

td {
    width:300px;
    border: 2px solid white;
    padding: 2px;
    text-align: center;
}

th {
    background-color: transparent;
}
</style>