<script lang="ts">
import { defineComponent } from "vue"
import axios from "axios"
import { IDsala } from "../types"
import { posto} from "../types"

export default defineComponent({
  data() {
    return {
      sala: [] as IDsala[],
      posti: [] as posto[]
    }
  },
  computed:{

  },
  methods: {
    getSala() {
        axios.get("/api/sala/" + this.$route.params.idproiezione)
        .then(response => {this.sala = response.data[0]; console.log(response.data)})
    },
    getPosti(){
      axios.get("/api/posti/" + this.$route.params.idproiezione+"/A")
      .then(response => {this.posti = response.data; console.log(response.data)})
    }
  },
  mounted() {
    this.getSala()
    this.getPosti()
  }
})
</script>

<!-- <template>
  <h2>posti sala</h2>
  <template v-if="sala">
    <h2>{{sala.fila}}</h2>
    <h2>{{ sala.posti_fila }}</h2>
    
  </template>
</template> -->

<template>
  <h1>Posti sala:</h1>

  <body>
    <div id="app">
      <div class="salaContainer">
        <div v-for= "posto in posti " :key="posto.idproiezione" class="chair">
            <div class="row">
                <li class="seat">{{ posto.fila}}{{ posto.numero}}</li>
            </div>    
        </div>        
      </div>
    </div>

  </body>

</template>



<style scoped>
h1 {
  color: aliceblue;
  margin-left: 10%;
}

.salaContainer{
    width: 92%;
    height: 90%;
    display: flex;
    padding-left: 15%;
}

/* .salaContainer  {
    padding: 10px 40px;
    background: unset;
} */

.salaContainer  .screen::before {
    content: '';
    position: absolute;
    width: 100%;
    height: 20px;
}

.salaContainer .chair {
    width: 95%;
    margin: auto;
}

.salaContainer .chair .row {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.salaContainer .chair .row span {
   color: #fff;
   font-weight: 600;
   font-size: 11px;
}

.salaContainer .chair .row li {
    position: relative;
    width: 20px;
    height: 15px;
    background: rgb(184, 184, 184, .3);
    list-style: none;
    border-radius: 5px;
    cursor: pointer;
    transition: .3s linear;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 15px;
    font-size: 12px;
    color: aliceblue;
}

.salaContainer .chair .row li::before {
    content: '';
    position: absolute;
    width: 100%;
    height: 5px;
    background:rgb(184, 184, 184, .3);
    bottom: -8px;
    border-radius: 10px;

}

.salaContainer  .chair .row li:hover {
    background: greenyellow;
    color: #000;
}

.salaContainer  .chair .row li:nth-child(6) {
    margin-right: 20px;
}

.salaContainer  .chair .row li:nth-last-child(6) {
    margin-left: 20px;
    color: rgb(30, 30, 30);
}
</style>
