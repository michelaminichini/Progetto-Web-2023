<script lang="ts">
import { defineComponent } from "vue"
import axios from "axios"
import { IDsala } from "../types"

export default defineComponent({
  data() {
    return {
      sala: null as IDsala | null
    }
  },
  methods: {
    getSala() {
        axios.get("/api/sala/" + this.$route.params.idproiezione)
        .then(response => {this.sala = response.data[0]; console.log(response.data)})
    }
  },
  mounted() {
    this.getSala()
  }
})
</script>

<template>
  <h2>posti sala</h2>
  <template v-if="sala">
    <h2>{{sala.fila}}</h2>
    <h2>{{ sala.posti_fila }}</h2>
    
  </template>
</template>

<style>
h2 {
    color: aliceblue;
}
</style>
