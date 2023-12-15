<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"

export default defineComponent({
  data() {
    return {
      email: "",
      password: "",
      nome:"",
      cognome:"",
      telefono:0,
      data_nascita:"",
      ruolo:"acquirente",
      confirmPassword: "",
    }
  },
  computed:{
    isSubmitDisabled(){
      return !this.email || !this.password || !this.nome || !this.cognome || !this.telefono || !this.data_nascita || !this.confirmPassword;
    }
  },
  methods: {
    async onSubmit() {
      if (this.password != this.confirmPassword) {
        alert("Le due password non coincidono.")
        return
      }
      try {
        await axios.post("/api/auth/register", {
          email: this.email,
          password: this.password,
          nome: this.nome,
          cognome: this.cognome,
          telefono: this.telefono,
          data_nascita: this.data_nascita,
          ruolo: this.ruolo
        })
        window.location.href ="/login"
      } catch (e: any) {
        if (e.response) {
          alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
        } else {
          alert(e.message)
        }
      }
    },
  },
})
</script>

<template>
  <div class="prose">
    <h1>Crea un account</h1>
    <form class="not-prose flex flex-col gap-3" @submit.prevent="onSubmit">
      <input
        id="primo"
        type="text"
        v-model="email"
        class="rounded-lg border-slate-200"
        placeholder="Email"
        required
      />
      <input
        id="secondo"
        type="password"
        v-model="password"
        class="rounded-lg border-slate-200"
        placeholder="Password"
        required
      />
      <input
        id="terzo"
        type="password"
        v-model="confirmPassword"
        class="rounded-lg border-slate-200"
        placeholder="Conferma password"
        required
      />
      <input
        id="quarto"
        type="text"
        v-model="nome"
        class="rounded-lg border-slate-200"
        placeholder="Nome"
        required
      />
      <input
        id="quinto"
        type="text"
        v-model="cognome"
        class="rounded-lg border-slate-200"
        placeholder="Cognome"
        required
      />
      <input
        id="sesto"
        type="number"
        v-model="telefono"
        class="rounded-lg border-slate-200"
        placeholder="Numero di telefono"
        required
      />
      <input
        id="settimo"
        type="date"
        v-model="data_nascita"
        class="rounded-lg border-slate-200"
        placeholder="Data di nascita"
        required
      />
      <button id="btn-crea-utente" type="submit" class="btn !bg-blue-500 text-white w-1/2 mx-auto mt-3" :disabled="isSubmitDisabled">
        Registrati
      </button>
      <RouterLink to="/profilo" class="text-white font-bold" style="display: block; margin: 5%;">Indietro</RouterLink>
    </form>
  </div>
</template>

<style scoped>
h1{
  margin:5%;
  padding:0;
  color:white;
}

input{
  display: inline;
  height: 50px;
  width:220px;
  margin-right: 1%;
  margin-left: 5%;
  margin-bottom: 2%;
}

#btn-crea-utente{
  display: inline;
  color:white;
  font-size: large;
  background-color: rgb(36, 91, 255);
  width:150px;
}




</style>
