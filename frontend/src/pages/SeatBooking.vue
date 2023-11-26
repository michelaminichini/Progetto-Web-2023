<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {IDproiezioneSB} from "../types" // tipo di interfaccia creata nel file types.ts

export default defineComponent({
    data(){
        return {
        proiezioneSB: [] as IDproiezioneSB []
        }
    },
    methods: {
        getProiezione() {
            axios.get("/api/proiezione").then(response => this.proiezioneSB = response.data)
        }
       
    },
    mounted() {
    this.getProiezione()
  }
})
</script>

<template>
    <h1>
     Scegli il posto...
    </h1>
    <h2>
        Seleziona ID della proiezione di cui vuoi visualizzare i posti nella sala:
    </h2>
<body>
    

    <div id="app">
        <div v-for=" proiezioni in proiezioneSB" :key="proiezioni.idproiezione">
            <article >
                <p>{{proiezioni.idproiezione}} </p>
            </article>
            <RouterLink :to="'/sala/' + proiezioni.idproiezione">Prenota posti </RouterLink>
        </div>
        
        

    </div>
</body>
</template>

<style>
h1, h2, p{
    color:aliceblue;
    margin: 10%;
}
</style>

