<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"
import UserInfo from "../components/user-info.vue"
import { User } from "../types"

export default defineComponent({
  components: { UserInfo },
  data() {
    return {
      user: null as User | null,
    }
  },
  methods: {
    async getUser() {
      const res = await axios.get("/api/auth/profile")
      this.user = res.data
    },
  },
  mounted() {
    this.getUser()
  },
})
</script>

<template>
  <header class="flex items-center p-6">
    <h2>Accedi qui al tuo profilo personale</h2>
    <div class="grow flex justify-end items-center gap-3">
      <UserInfo v-if="user" :user="user" />
      <template v-else>
        <RouterLink to="/login" class="btn" id="bottone-login">Login</RouterLink>
        <h2>Oppure registrati se non possiedi già un account</h2>
        <RouterLink to="/register" class="btn !bg-blue-500 text-white" id="bottone-reg">Registrati</RouterLink>
      </template>
    </div>
    <RouterLink to="/" class="text-white font-bold" style="display: block; margin: 5%; font-size: large;">Indietro</RouterLink>
  </header>
  <main class="grow py-6 border-y border-slate-200 mx-6">
    <!-- Passa l'utente come prop a tutte le pagine del router -->
    <RouterView :user="user" />
  </main>
</template>

<style scoped>
h2{
  display: block;
  margin-top:5%;
  margin-bottom: 2%;
  text-align: center;
}

#bottone-login, #bottone-reg{
  display: block;
  margin: 0 auto;
  width:400px;
  height: 50px;
  text-align: center;
  font-size: large;
  background-color: blue;
  color: white;
}

#button{
  margin-top: 0;
}

</style>
