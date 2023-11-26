<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {SchedaF} from "../types" // tipo di interfaccia creata nel file types.ts

export default defineComponent({
  data(){
      return {
      currentProjection: -1,
      filmS:  null as SchedaF | null,
      ProjS: [] as SchedaF[]
      }
  },
  methods: {
    getFilm() {
        axios.get("/api/film/" + this.$route.params.idfilm)
        .then(response => {this.filmS = response.data[0]; console.log(response.data)})
    },
    getProj() {
        axios.get("/api/film/" + this.$route.params.idfilm)
        .then(response => {this.ProjS = response.data; console.log(response.data)})
    },
    changeProjection() {
      console.log(this.currentProjection)
    }
  },
  mounted() {
    this.getFilm()
    this.getProj()
  }
})
</script>

<template>
    <template v-if =filmS>
      <article>
        <h2>{{filmS.titolo}}</h2>
        <img style="height: 400px; width: 300px;" :src="'/img/' + filmS.locandina" alt=""/>
        <p>Regista: {{filmS.regista}}</p>
        <p>Anno di uscita: {{filmS.anno}} </p>
        <!-- <p>Genere: {{filmS.genere}}</p> -->
        <p>{{filmS.descrizione}}</p>
        <!-- <p>Data di programmazione: {{filmS.datap.slice(0, 10)}}</p>
        <p>Orario: {{filmS.orario.slice(0, 5)}}</p> -->
      </article>
    </template>
    <!-- <div v-for="film in filmS"> -->
    <div>
      <h2>Date di programmazione: </h2>
      <select class="firstLastNames linkBox"  v-model="currentProjection" @change="changeProjection()" >
        <option disabled >Scegli una proiezione</option>
        <option v-for="projection in ProjS" :key="projection.idproiezione" :value="projection.idproiezione">{{projection.datap.slice(0, 10)}} ore {{ projection.orario.slice(0, 5) }}</option>
      </select>
    </div>
  </template>
 

<style scoped>

    article{
      color:aliceblue;
      margin-left: 5%;
    }


</style>