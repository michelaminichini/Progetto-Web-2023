<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"

export default defineComponent({
  data() {
    return {
      email: "",
      password: "",
      confirmPassword: "",
    }
  },
  computed:{
    isSubmitDisabled(){
      return !this.email || !this.password || !this.confirmPassword;
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
}

input{
  display: inline;
  height: 50px;
  width:220px;
  margin-right: 1%;
  margin-left: 5%;
}

#btn-crea-utente{
  display: inline;
  color:white;
  background-color: rgb(36, 91, 255);
  width:150px;
}




</style>
