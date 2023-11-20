<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" //qui Film si riferisce al tipo di interfaccia da creare in un file types.ts

export default defineComponent({
    data(){
        return {
        datiFilm: [] as Film[]
        }
    },
    methods: {
        getFilminLista(){
            axios.get("/api/films").then(response => this.datiFilm = response.data)
        }
    },
    mounted(){
        this.getFilminLista()
   }

})


</script>


<template>
    

</template>