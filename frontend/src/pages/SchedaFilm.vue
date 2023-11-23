<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {SchedaF} from "../types" // tipo di interfaccia creata nel file types.ts

export default defineComponent({
    data(){
        return {
        filmS: null as SchedaF | null
        }
    },
    methods: {
    getFilm() {
        axios.get("/api/film/" + this.$route.params.idfilm)
        .then(response => this.filmS = response.data[0])
    }
  },
  mounted() {
    this.getFilm()
  }
})
</script>

<template>
    <template v-if=filmS>
      <h2>{{filmS.titolo}}</h2>
      <article>
        <img :src="'/img/'" + filmS.locandina alt="" />
        <h3>{{filmS.regista}}</h3>
        <p>{{filmS.anno}} </p>
        <p>{{filmS.genere}}</p>
      </article>
    </template>
  </template>
  
<!-- <template>
    <div id="#app">
    <h1>Scheda film: </h1>
    <body>
        <article v-if="film">
        <h2>Titolo:{{film.titolo}}</h2>
            <img :src="'/img/' + film.locandina" alt="" />
            <p>Regista:{{film.regista}}</p>

        </article>
    </body>    
    </div>
</template> -->



<style>
    h1, h2, p{
        color:aliceblue;
    }

</style>