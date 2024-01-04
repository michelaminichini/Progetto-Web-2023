<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" 

export default defineComponent({
    data(){
        return {
        prossimiFilm: [] as Film[]
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
            <div v-for= "film in prossimiFilm" :key="film.idfilm" class="cineContainer">
                <article>
                    <h2>{{ film.titolo }}</h2>
                    <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                    <table>
                        <tr>
                            <th>Diretto da</th>
                            <td>{{ film.regista }}</td>
                        </tr>
                        <tr>
                            <th>Anno uscita</th>
                            <td>{{ film.anno }}</td>
                        </tr>
                        <tr>
                            <th>Genere</th>
                            <td>{{ film.genere }}</td>
                        </tr>
                    </table>  
                </article>
            
            </div>
        </div>

    </body>

</template>


<style scoped>
h1{
    color:white;
    margin: 3%;
    margin-left: 5%;
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