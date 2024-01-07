<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {FilmEG,SchedaEP} from "../types"

export default defineComponent({
  data(){
      return {
      currentProjection: -1,
      filmS:  null as FilmEG | null,
      ProjS: [] as SchedaEP[]
      }
  },
  methods: {
    getFilm() {
        axios.get("/api/film/" + this.$route.params.idfilm)
        .then(response => {this.filmS = response.data[0]; console.log(response.data)})
    },
    getProj() {
        axios.get("/api/elenco/" + this.$route.params.idfilm)
        .then(response => {this.ProjS = response.data; console.log(response.data)})
    },
    changeProjection() {
      console.log(this.currentProjection)
      sessionStorage.setItem("proiezione", this.currentProjection.toString());
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
      <table>
        <tr>
          <th>Regista</th>
          <td>{{filmS.regista}}</td>
        </tr>
        <tr>
          <th>Anno uscita</th>
          <td>{{filmS.anno}}</td>
        </tr>
        <tr>
          <th>Genere</th>
          <td>{{filmS.genere}}</td>
        </tr>
        <tr>
          <th>Durata</th>
          <td>{{filmS.durata}}'</td>
        </tr>
        <tr>
          <th>Attori principali</th>
          <td>{{filmS.attori}}</td>
        </tr>
        <tr>
          <th>Trama</th>
          <td>{{filmS.descrizione}}</td>
        </tr>
      </table>
    </article>
  </template>
  <br><br>
  <div>
    <h2>Date di programmazione: </h2>
    <select class="firstLastNames linkBox"  v-model="currentProjection" @change="changeProjection()" >
      <option disabled >Scegli una proiezione</option>
      <option v-for="projection in ProjS" :key="projection.idproiezione" :value="projection.idproiezione">{{projection.dataorap.slice(0,10)}} ore {{ projection.orario.slice(0, 5) }}</option>
    </select>
    <RouterLink class="btn btn-primary" :to="'/PostiSala'" role="button" id="button">Next</RouterLink>
  </div>

</template>

<style scoped>
article{
  color:aliceblue;
  margin-left: 5%;
}

article > h2{
  margin-left: 0;
  margin-top:2%;
  margin-bottom: 3%;
}

article > p{
  padding:0;
  margin:0;
}

div > h2{
  display: inline;
  margin-top:2%;
  margin-bottom: 0;
  margin-left:5%;
  padding: 0;
  color: white;
}

div > select{
  display: inline;
}

table {
    display: inline;
    margin-left: 10%;
    width: 100%;
    margin-top: 0px;
}

td {
    width:500px;
    border: 2px solid white;
    padding: 2px;
    text-align: center;
}

th {
    background-color: transparent;
}

#button{
  margin-left: 10%;
}


</style>