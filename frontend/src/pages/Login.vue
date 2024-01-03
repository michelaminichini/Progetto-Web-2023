<script lang="ts">
import axios from "axios"
import { defineComponent, withModifiers } from "vue"

export default defineComponent({
  data() {
    return {
      email: "",
      password: "",
    }
  },
  methods: {
    async onSubmit() {
      try {
        const response = await axios.post("/api/auth/login", {
          email: this.email,
          password: this.password,
        })

        const user = response.data;
        console.log('User Object:', user);
        //let data = sessionStorage.getItem("key");
        if (user) {
          // Se l'utente che esegue il login è un acquirente, viene rediretto ad una determinata pagina
          if (user.ruolo === "acquirente") {
            this.$router.push('/PostiSala');
            //se invece l'utente che esegue il login è un amministratore, viene rediretto ad un'altra pagina
          } else if (user.ruolo === "amministratore"){
            window.location.href = "/adminpage"; 
          }
        }
      } catch (e:any) {
        if (e.response) {
          alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`);
        } else {
          alert(e.message);
        }
      }

    }
  },
})
</script>

<template>
  <div class="prose">
    <h1 style="margin:3%; padding:1%;">Login</h1>
    <form class="not-prose flex flex-col gap-3" @submit.prevent="onSubmit">
      <input
        type="text"
        v-model="email"
        class="rounded-lg border-slate-200"
        placeholder="Email"
        required
      />
      <input
        type="password"
        v-model="password"
        class="rounded-lg border-slate-200"
        placeholder="Password"
        required
      />
      <button id="accedi" type="submit" class="btn !bg-blue-500 text-white w-1/2 mx-auto mt-3">Accedi</button>
    </form>
    <RouterLink to="/profilo" class="text-white font-bold" style="display: block; margin: 5%;">Indietro</RouterLink>
  </div>
</template>


<style scoped>
h1{
  color: aliceblue;
}

input{
  display: inline;
  height: 40px;
  width:220px;
  margin-right: 1%;
  margin-left: 4%;
}

#accedi{
  display: inline;
  color: white;
  background-color: rgb(36, 91, 255);
  width:150px;
}
</style>