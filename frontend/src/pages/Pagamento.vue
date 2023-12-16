<script lang="ts">
import { defineComponent } from 'vue';
import axios from "axios"
import { DatiUtente, User } from '../types';

export default defineComponent({
    data(){
        return{
            user: null as User | null,
            datiUtente: [] as DatiUtente [],
            Numero_carta:0,
            Data_scadenza:"",
            CVV:0,
            //idbiglietto:0,
            //tipo_pagamenti:1,
            //importo:10,     
        }
    },
    methods:{
        async getDatiUtente(){
            const res = await axios.get("/api/auth/profile")
            this.user = res.data
            console.log(this.user) 
            const id = this.user?.idutente                    
            console.log("Id "+id)
            const res1 = await axios.get("/api/leggiutente/"+ id)
            this.datiUtente = res1.data
            console.log(this.datiUtente)
            //const datann = dayjs(this.datiUtente[0].data_nascita).format('DD-MM-YYYY')
            //this.datan = this.datiUtente[0].data_nascita
    
        },
        async aggiornaDatiPagamento(){
            try {
                const idutente = this.user?.idutente;
                if (!idutente) {
                    console.error("User ID not available");
                    return;
                }
                const paymentData = {
                    //idutente: idutente,
                    Numero_carta: this.Numero_carta,
                    Data_scadenza: this.Data_scadenza,
                    CVV: this.CVV,
                };
                await axios.post("/api/aggiornapagamento", paymentData);

                this.Numero_carta = 0;
                this.Data_scadenza = "";
                this.CVV = 0;

                
            } catch (e: any) {
                if (e.response) {
                    alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
                } else {
                    alert(e.message)
                }
            } 
            //window.location.href ="/profilo"
            this.$router.push('/profilo');
        },
    
    },
    mounted(){
        this.getDatiUtente()
    }
})

</script>



<template>
    <h1>Pagamento</h1>
<body>
    <div class="container">
        <form @submit.prevent="aggiornaDatiPagamento">
            <h3 class="title">Inserire dati per effettuare il pagamento</h3>
                    <div class="inputBox">
                        <span>Numero Carta</span>
                        <input 
                        v-model="Numero_carta"
                        type="number" 
                        class="rounded-lg border-slate-200"
                        placeholder="1111-2222-3333-4444"
                        />
                    </div>
                    <div class="inputBox">
                        <span>Data scadenza</span>
                        <input 
                        v-model="Data_scadenza"
                        type="date"
                        class="rounded-lg border-slate-200"
                        />
                    </div>
                    <div class="inputBox">
                        <span>CVV</span>
                        <input 
                        v-model="CVV"
                        type="number" 
                        class="rounded-lg border-slate-200"
                        placeholder="123"
                        />
                    </div>
                       
            <button type="submit" style="background-color: blue; color: white; display: inline;">Procedi all'acquisto</button>
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