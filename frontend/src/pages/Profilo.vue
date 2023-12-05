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
    <h1>Accedi qui al tuo profilo personale</h1>
    <div class="grow flex justify-end items-center gap-3">
      <UserInfo v-if="user" :user="user" />
      <template v-else>
        <RouterLink to="/login" class="btn" id="bottone-login">Login</RouterLink>
        <RouterLink to="/register" class="btn !bg-blue-500 text-white" id="bottone-reg">Registrati</RouterLink>
      </template>
    </div>
    <RouterLink to="/" class="text-blue-500 font-bold" style="display: block; margin: 5%;">Indietro</RouterLink>
  </header>
  <main class="grow py-6 border-y border-slate-200 mx-6">
    <!-- Passa l'utente come prop a tutte le pagine del router -->
    <RouterView :user="user" />
  </main>
  <!--footer class="flex p-6">
    <RouterLink to="/" class="text-blue-500 font-bold m-auto">Vuepost</RouterLink>
  </footer-->
</template>

<style scoped>
h1{
  margin-left: 5%;
  margin-bottom: 5%;
}

#bottone-login{
  display: block;
  margin: 0 auto;
  width:400px;
  height: 50px;
  text-align: center;
  font-size: large;
  background-color: blue;
  color: white;
}

#bottone-reg{
  display: block;
  margin: 0 auto;
  width:400px;
  height: 50px;
  text-align: center;
  font-size: large;
  margin-top: 3%;
  background-color: blue;
  color: white;
}


</style>
