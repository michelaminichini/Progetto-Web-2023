<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"

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
        await axios.post("/api/auth/login", {
          email: this.email,
          password: this.password,
        })
        window.location.href = "/PostiSala/:idproiezione"
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
    <h2 style="margin:0; padding:0;">Login</h2>
    <form class="not-prose flex flex-col gap-3" @submit.prevent="onSubmit">
      <input
        type="text"
        v-model="email"
        class="rounded-lg border-slate-200"
        placeholder="Email"
      />
      <input
        type="password"
        v-model="password"
        class="rounded-lg border-slate-200"
        placeholder="Password"
      />
      <button type="submit" class="btn !bg-blue-500 text-white w-1/2 mx-auto mt-3">Accedi</button>
    </form>
    <!--PROVVISORIO pulsante per profilo utente, poi da rimuovere-->
    <RouterLink class="btn btn-primary" :to="'/profiloutente'" role="button" id="button">LoginUtente</RouterLink> 

  </div>
</template>


<style>
h2{
  color: aliceblue;
}
</style>