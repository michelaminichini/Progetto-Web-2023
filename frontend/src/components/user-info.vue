<script lang="ts">
import axios from "axios"
import { PropType, defineComponent } from "vue"
import { User } from "../types"

export default defineComponent({
  props: {
    user: Object as PropType<User>,
  },
  methods: {
    async logout() {
      await axios.post("/api/auth/logout")
      window.location.reload()
    },
  },
})
</script>

<template>
  <div id="div-info">
    <span class="text-sm">{{ user?.email }}</span>
    <button id="bottone-logout" class="btn !px-2" title="LOGOUT" @click="logout"> <!--CON "TITLE" VIENE VISUALIZZATO UN BREVE MESSAGGIO QUANDO IL CURSORE SI POSIZIONA SUL PULSANTE-->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="h-5 w-5">
        <path
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="1.5"
          d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9"
        />
      </svg>
    </button>
  </div>
  <div
    id="div-utente"
    class="h-9 w-9 flex rounded-full"
    :class="{ 'bg-blue-500': user?.ruolo != 'amministratore', 'bg-rose-500': user?.ruolo == 'amministratore' }"
  >
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 20 20"
      class="h-2 w-2 text-white/70 m-auto"
    >
      <path
        fill="currentColor"
        d="M10 8a3 3 0 1 0 0-6a3 3 0 0 0 0 6Zm-6.535 6.493a1.23 1.23 0 0 0 .41 1.412A9.957 9.957 0 0 0 10 18c2.31 0 4.438-.784 6.131-2.1c.43-.333.604-.903.408-1.41a7.002 7.002 0 0 0-13.074.003Z"
      />
    </svg>
    <RouterLink to="/profiloutente" class="btn" role="button" id="button">Vedi profilo</RouterLink> 
  </div>
</template>

<style scoped>

#bottone-logout{
  display: inline; 
  background-color: rgb(0, 0, 255); 
  color:white; 
  width: 50px;
  
}

div > svg{
  max-width: 100px;
  display: inline;
  padding-top:5%;

}

#div-info{
  display: block;
  text-align: center;
}

#div-utente{
  display: block;
  text-align: center;
  margin-bottom: 3%;

}

#button{
  margin-top: 0;
  display: block;
  margin: 0 auto;
  width:400px;
  height: 50px;
  text-align: center;
  font-size: large;
  background-color: blue;
  color: white;
  margin-top:3%;
}


</style>