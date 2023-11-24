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
        .then(response => {this.filmS = response.data[0]; console.log(response.data)})
    }
  },
  mounted() {
    this.getFilm()
  }
})
</script>

<template>
    <template v-if=filmS>
      <article>
        <h2>{{filmS.titolo}}</h2>
        <h3>Regista: {{filmS.regista}}</h3>
        <img style="height: 400px; width: 300px;" :src="'/img/' + filmS.locandina" alt=""/>
        <p>Anno di uscita: {{filmS.anno}} </p>
        <p>Genere: {{filmS.genere}}</p>
        <p>{{filmS.descrizione}}</p>
        <p>Data di programmazione: {{filmS.datap}}</p>
        <p>Orario: {{filmS.orario}}</p>
      </article>
    </template>
  </template>
 

<style scoped>

    article{
      color:aliceblue;
      margin-left: 5%;
    }


</style>