<script lang="ts">
import { defineComponent } from 'vue';
import axios from "axios"
import { DatiUtente, DatiPagamento, Tpag, PostoL } from '../types';

export default defineComponent({
    data(){
        return{
            user: '',
            datiUtente: [] as DatiUtente [],
            tipoPag: [] as Tpag [],
            nomeT: null,
            cognomeT: null,
            tipo_pagamenti: 0,
            Numero_carta: null,
            Data_scadenza:"",
            CVV: null,
            importo: "",
            posti: "",
            isPopupOpen: false,
            costo: null as PostoL | null,
            IDpag: null,
            datiPag: [] as DatiPagamento [],
            IDproiez: "",
        }
    },
    methods:{
        getParP(){
            const imp = sessionStorage.getItem("importo")
            console.log(imp)
            this.importo = imp+""
            console.log(this.importo)
            const posti = sessionStorage.getItem("posti")
            console.log(posti)
            this.posti = posti+""
            console.log(this.posti)
            const idP = sessionStorage.getItem("proiezione")
            console.log(idP)
            this.IDproiez = idP+""
            console.log(this.IDproiez)
            const user = sessionStorage.getItem("utente")
            console.log(user)
            this.user = user+""
            console.log(this.user)
 
        },
        async aggiornaDatiPagamento(){
            try {
                const paymentData = {
                    tipo_pagamenti: this.tipo_pagamenti,           
                    importo: this.importo,
                    nomeT: this.nomeT,
                    cognomeT: this.cognomeT,
                    Numero_carta: this.Numero_carta,
                    Data_scadenza: this.Data_scadenza,
                    CVV: this.CVV,
                };
                console.log('Dati pag: ',paymentData);
                await axios.post("/api/aggiornapagamento", paymentData);
            } catch (e: any) {
                if (e.response) {
                    alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
                } else {
                    alert(e.message)
                }
            } 
        },

        getTipoPag() {
            axios.get("/api/tipopag")
            .then(response => {this.tipoPag = response.data
                console.log(response.data)
                console.log(this.tipoPag)
            })
        },

        getIDpag() {   
            axios.get("/api/leggipag")
            .then(response => {this.datiPag = response.data
                console.log('Query IDpag')
                console.log(response.data)
                console.log(this.datiPag[0].idpagamento)
            })
        },

        changePagamenti()
        {
            if (!this.tipo_pagamenti){
                this.tipo_pagamenti = 0
            }
            console.log(this.tipo_pagamenti)
        },

        async aggiornaBiglietti()
        {
            console.log('Biglietti')
            let idpg = this.datiPag[0].idpagamento
            idpg = idpg.toString()
            console.log(this.IDproiez)
            console.log(idpg)//idpagamento
            console.log(this.posti)    //idposto
            const id_ut = this.user
            console.log(id_ut)
            const ticketData = {
                idutenteT:  id_ut,
                idproj: this.IDproiez,
                idpag: idpg, //idpagamento
                posti:  this.posti    //idposto
            }
            console.log(ticketData);
            try {
                await axios.post("/api/aggiornaticket", ticketData); 
                
            } catch (e: any) {
                if (e.response) {
                    alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
                } else {
                    alert(e.message)
                }
            } 
            //azzero dati transizione
            sessionStorage.setItem("proiezione","")         
        },

        openPopup() {
            this.aggiornaDatiPagamento(); 
            this.getIDpag(); 
            this.isPopupOpen = true;        
        },

        closePopup() {
            this.isPopupOpen = false;
            this.aggiornaBiglietti();
            this.$router.push("/profilo"); // utente rediretto alla pagina del proprio profilo quando la popup window message viene chiusa
        },
        
        getImporto(){
            const storedImporto = sessionStorage.getItem('totalCost');
            if (storedImporto !== null) {
                this.importo = storedImporto;
                console.log(this.importo);
            } else {
                 // Handle the case where storedImporto is null (optional)
                console.error('Stored importo è null');
            }
        }
        
    },
    mounted(){
        this.getParP()
        this.getTipoPag()
    }
})
</script>



<template>
<body>    
    <div class="container">
        <h1>Pagamento: </h1>        
        <form>
            <h3 class="title">Totale {{ importo }}€ Posti: {{ posti }}</h3>
            <h3 class="title">Inserire dati per effettuare il pagamento</h3>
                    <div class="inputBox">
                        <span>Tipo di pagamento</span>
                        <select class="firstLastNames linkBox"  v-model="tipo_pagamenti" type="number" @change="changePagamenti()" >
                            <option disabled >Scegli un tipo di pagamento</option>
                            <option v-for="ttpag in tipoPag" :key="ttpag.idtipo_pagamento" :value="ttpag.idtipo_pagamento">{{ttpag.Descrizione}} - {{ ttpag.Circuito }}</option>
                        </select>
                    </div>
                    <div class="inputBox">
                        <span>Nome titolare</span>
                        <input 
                        v-model="nomeT"
                        type="text" 
                        class="rounded-lg border-slate-200"
                        placeholder="Nome"
                        />
                    </div>
                    <div class="inputBox">
                        <span>Cognome titolare</span>
                        <input 
                        v-model="cognomeT"
                        type="text" 
                        class="rounded-lg border-slate-200"
                        placeholder="Cognome"
                        />
                    </div>
                    <div class="inputBox">
                        <span>Numero Carta</span>
                        <input 
                        v-model="Numero_carta"
                        type="text" 
                        class="rounded-lg border-slate-200"
                        placeholder="0000 0000 0000 0000" 
                        data-slots="0"
                        data-accept="\d"
                        />
                    </div>
                    <div class="inputBox">
                        <span>Data scadenza</span>
                        <input 
                        v-model="Data_scadenza"
                        type="text"
                        class="rounded-lg border-slate-200"
                        placeholder="MM/YY"
                        />
                    </div>
                    <div class="inputBox">
                        <span>CVV</span>
                        <input 
                        v-model="CVV"
                        type="text" 
                        class="rounded-lg border-slate-200"
                        placeholder="123"
                        />
                    </div>
        </form>              
            <button type="submit" style="background-color: blue; color: white; display: inline;" @click="openPopup">Procedi all'acquisto</button>
            <dialog :open="isPopupOpen">
                <p>Pagamento effettuato con successo! Grazie e buona visione</p>
                <button @click="closePopup">
                    Chiudi
                </button> 
            </dialog>
        
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