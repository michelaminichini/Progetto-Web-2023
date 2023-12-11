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
        const response = await axios.post("/api/auth/login", {
          email: this.email,
          password: this.password,
        })


        // Assuming your backend returns user details including the role if authentication is successful
        const user = response.data;
        console.log('User Object:', user);
        
        // Check the user role
        if (user) {
          if (user.ruolo === "acquirente") {
            window.location.href = "/PostiSala/:idproiezione";
            //await this.$router.push('/provaGiulia')
          } else if (user.ruolo === "amministratore"){
            window.location.href = "/provaGiulia"; 
            //await this.$router.push('/PostiSala/:idproiezione')
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
      />
      <input
        type="password"
        v-model="password"
        class="rounded-lg border-slate-200"
        placeholder="Password"
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