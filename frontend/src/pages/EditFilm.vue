<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import { FilmEG } from "../types" // tipo di interfaccia creata nel file types.ts

export default defineComponent({
  data(){
    return {
      datiFilm:  [] as FilmEG [],
      editmode: false,
      isPopupOpen: false,
    }
  },
  methods: {
    getFilm() {
        console.log(this.$route.params.idfilm)
        axios.get("/api/editfilm/" + this.$route.params.idfilm)
        .then(response => {this.datiFilm = response.data; console.log(response.data)})
        console.log(this.datiFilm)
    },

    updateDatiFilm(){
      this.editmode = false;
      const riga = this.datiFilm[0];           
      axios.put("/api/aggiornamento",riga)
      .then(response => {console.log(response.data)})
      console.log(riga);
      console.log('Dati salvati')
    },
    // Pop-up window viene aperta o chiusa in base allo stato della variabile isPopupOpen
    openPopup() {
      this.isPopupOpen = true;
    },
    closePopup() {
      this.isPopupOpen = false;
    },
    edit: function() {
      this.editmode = !this.editmode;
    },
  },
  mounted() {
    this.getFilm()
  }
})
</script>

<template>
    <h1>Modifica dati film</h1>
    <div v-for= "film in datiFilm" :key="film.idfilm" id="contenitore" class="row">
    
                    <div v-if="editmode">
                        Titolo: 
                        <input v-model="film.titolo">
                    </div>
                    <div v-else>Titolo: {{film.titolo}}</div>
                    <div v-if="editmode">
                        Regista: 
                        <input v-model="film.regista">
                    </div>
                    <div v-else>Regista: {{film.regista}}</div>
                    <div v-if="editmode">
                        Genere: 
                        <input v-model="film.genere" placeholder="genere film">
                    </div>
                    <div v-else>Genere: {{film.genere}}</div>
                    <div v-if="editmode">
                        Durata: 
                        <input v-model="film.durata" placeholder="durata film">
                    </div>
                    <div v-else>Durata: {{film.durata}}</div>
                    <div v-if="editmode">
                        Nazione: 
                        <input v-model="film.nazione" placeholder="nazione film">
                    </div>
                    <div v-else>Nazione: {{film.nazione}}</div>
                    <div v-if="editmode">
                        Anno: 
                        <input v-model="film.anno" placeholder="anno uscita film">
                    </div>
                    <div v-else>Anno: {{film.anno}}</div>
                    <div v-if="editmode">
                        Descrizione: 
                        <textarea v-model="film.descrizione" placeholder="descrizione film"></textarea>
                    </div>
                    <div v-else>Descrizione: {{film.descrizione}}</div>
                    <div v-if="editmode">
                        Url trailer: 
                        <input v-model="film.trailer" placeholder="trailer film">
                    </div>
                    <div v-else>Url trailer: {{film.trailer}}</div>
                    <div v-if="editmode">
                        Url locandina: 
                        <input v-model="film.locandina" placeholder="locandina film">
                    </div>
                    <div v-else>Url locandina: {{film.locandina}}</div>
                    <div v-if="editmode">
                        Lingua: 
                        <input v-model="film.lingua" placeholder="lingua film">
                    </div>
                    <div v-else>Lingua: {{film.lingua}}</div>  
                    <div v-if="editmode">
                        Attori: 
                        <input v-model="film.attori" placeholder="attori film">
                    </div>
                    <div v-else>Attori: {{film.attori}}</div>    
                    <div v-if="editmode">
                        Stato: 
                        <input v-model="film.stato" placeholder="stato film">
                    </div>
                    <div v-else>Stato: {{film.stato}}</div>              
                    <div>
                        <button v-on:click="edit()" class="btn btn-danger">edit</button>
                        <button type="button" v-on:click="updateDatiFilm()" class="btn btn-danger"  @click="openPopup">save</button>
                        <dialog :open="isPopupOpen">
                            <p>Modifiche effettuate con successo!</p>
                            <button @click="closePopup">Chiudi</button>
                        </dialog>
                        
                    </div>                          
                </div>
    <div>
      <RouterLink class="btn btn-primary" :to="'/adminpage'" role="button" id="button">Indietro</RouterLink>
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

div{
  margin-left: 5%;
  color:aliceblue;  
}

h1{
  margin-left: 5%;
  color:aliceblue;  
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
  margin-top: 1%;
  margin-left: 10%;
}

</style>