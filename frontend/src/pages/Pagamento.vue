<script lang="ts">
import { defineComponent } from 'vue';
import axios from "axios"

export default defineComponent({
    data(){
        return{
            Numero_carta:0,
            Data_scadenza:"",
            CVV:0,
            idbiglietto:0,
            tipo_pagamenti:1,
            importo:10,     
        }
    },
    methods:{
        async pagamentoEffettuato(){
            alert("Pagamento andato a buon fine \nGrazie e buona visione")
        },
        async aggiornaDatiPagamento(){
             try {
                await axios.post("/api/aggiornapagamento", {
                    Numero_carta: this.Numero_carta,
                    Data_scadenza: this.Data_scadenza,
                    CVV: this.CVV,
                    idbiglietto: this.idbiglietto,
                    tipo_pagamenti: this.tipo_pagamenti,
                    importo: this.importo,
                })
            } catch (e: any) {
                if (e.response) {
                    alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
                } else {
                    alert(e.message)
                }
            } 
            //window.location.href ="/profilo"
            this.$router.push('/profilo');
        }
        
    },
    
})

</script>



<template>
    <h1>Pagamento</h1>

<body>
    <div class="container">
        <form>
            <div class="row">

                <div class="col">
                    
                    <h3 class="title">Inserire dati per effettuare il pagamento</h3>

                    <div class="inputBox">
                        <span>Numero Carta</span>
                        <input type="number" placeholder="1111-2222-3333-4444">
                    </div>
                    <div class="inputBox">
                        <span>Data scadenza</span>
                        <input type="date">
                    </div>
                    <div class="inputBox">
                        <span>CVV</span>
                        <input type="number" placeholder="123">
                    </div>
                </div>
            </div>
                       
            <button style="background-color: blue; color: white; display: inline;" @click="aggiornaDatiPagamento">Procedi all'acquisto</button>

        </form>
    </div>

</body>


</template>

<style scoped>
body{
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    margin:0;
    padding:0;
    outline: none;
    border:none;
    text-transform:capitalize;
    transition: all .2s linear;
}

h3{
    color: #fff;
    padding-bottom: 5%;
}

h1{
    color: #fff;
    margin-left: 5%;
    padding-bottom: 2%;
}

div > span{
    color: white;
    margin:2%;
    padding-right: 2%;
}

form > input{
    width:20%;
    margin-left: 52%;
    padding:12px;
    font-size: 17px;
    background: #fff;
    color: black;
    margin-top: 5px;
    cursor: pointer;
}


</style>