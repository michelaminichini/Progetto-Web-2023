<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"
import { User } from "../types"
import { DatiUtente } from "../types";
import { CronoUtente } from "../types";
import { UpdateUser } from "../types";

export default defineComponent({
    data(){
        return {
            activeDiv: null,
            crono: [] as CronoUtente [],
            user: null as User | null,
            utenteAggiornato: [] as UpdateUser [],
            datiUtente: [] as DatiUtente [],
            editmode: false,
        };
      
    },
    
    methods:{
        
        dateToYYYYMMDD(d: { getTime: () => number; getTimezoneOffset: () => number; }) {
            return d && new Date(d.getTime()-(d.getTimezoneOffset()*60*1000)).toISOString().split('T')[0];
        },
        
        updateValue(event: Event) {
            if (event instanceof InputEvent) {
                const target = event.target as HTMLInputElement;
                this.$emit('input', target.valueAsDate);
            }
        },

        selectAll: function (event: Event) {
            setTimeout(function () {
                const target = event.target as HTMLInputElement;
                target!.select();
            }, 0);
        },

        edit: function() {
            this.editmode = !this.editmode;
        },
        
        toggleDiv(index: any){
            this.activeDiv = this.activeDiv === index ? null: index;
        },
        
        async getCronologia(){ 
            const res = await axios.get("/api/auth/profile")
            this.user = res.data
            console.log(this.user) 
            const id = this.user?.idutente                    
            console.log("Id "+id)
            const res1 = await axios.get("/api/cronologia/"+id)
            this.crono = res1.data
            console.log(this.crono)
        },

        async getDatiUtente(){
            const res = await axios.get("/api/auth/profile")
            this.user = res.data
            console.log(this.user) 
            const id = this.user?.idutente                    
            console.log("Id "+id)
            const res1 = await axios.get("/api/leggiutente/"+ id)
            this.datiUtente = res1.data
            console.log(this.datiUtente)
        },

        async updateDatiUtente(){
            const datiU = this.datiUtente
            console.log(datiU)
            axios.put("/api/aggiornautente", datiU)
            .then(response => {console.log(response.data)})
        },
    },
    mounted(){
        this.getCronologia()
        this.getDatiUtente()
        
    }
})
</script>

<template>
    <body>
        <section>
            <h1>Impostazioni Profilo Personale</h1>
        </section>
        <div id="CONTAINER" class="container">
            <div id="NavContainer" class="nav-container">
                <nav id="nav-profilo-utente">
                    <a class="tab active" @click="toggleDiv(0)">
                        <i>
                            <img src="/user-icon.png" alt="Logo" width="30" height="30">
                        </i>
                    </a>
                    <a class="tab" @click="toggleDiv(1)">
                        <i>
                           
                        </i>
                    </a>
                    <a class="tab" @click="toggleDiv(2)">
                        <i>
                            <img src="/setting-icon.png" alt="Logo" width="30" height="30">
                        </i> 
                    </a>
                    <a class="tab" @click="toggleDiv(3)">
                        <i>
                            <img src="/clock-line-icon.png" alt="Logo" width="30" height="30">
                        </i> 
                    </a>
                </nav>
            </div>

            <div v-show="activeDiv === 0" class="primo">
                  
                <div v-for= "utente in datiUtente" :key="utente.idutente" id="contenitore" class="row">
                    <h1>Informazioni personali</h1>
                    <h2>Se i dati inseriti al momento della registrazione non sono corretti, puoi modificarli qui</h2>
                    <div v-if="editmode">
                        Nome: 
                        <input v-model="utente.nome">
                    </div>
                    <div v-else>Nome: {{utente.nome}}</div>
                    <div v-if="editmode">
                        Cognome: 
                        <input v-model="utente.cognome">
                    </div>
                    <div v-else>Cognome: {{utente.cognome}}</div>
                    <div v-if="editmode">
                        Data di nascita: 
                        <input v-model="utente.data_nascita">
                        <input
                            type="date"
                            ref="input"
                            v-bind="dateToYYYYMMDD"
                            v-on:input="updateValue($event)"
                            v-on:focus="selectAll"
                        > 
                    </div>
                    <div v-else>Data di nascita: {{utente.data_nascita.slice(0, 10)}}</div>
                    <div v-if="editmode">
                        Telefono: 
                        <input v-model="utente.telefono" placeholder="numero di telefono">
                    </div>
                    <div v-else>Telefono: {{utente.telefono}}</div>
                    <div>
                        <button v-on:click="edit()" class="btn btn-danger">edit</button>
                    
                    <button v-on:click="updateDatiUtente()" class="btn btn-danger">save</button>
                    </div>                        
                </div>
            </div>

            <div v-show="activeDiv === 1" class="secondo">
                <h1>Informazioni Pagamento</h1>
                <h2>Metodo di pagamento</h2>
                <input type="text" class="input" placeholder="MasterCard">

                <h2>Numero carta</h2>
                <input type="text" class="input" placeholder="0000000000000000">

                <h2>Data di scadenza</h2>
                <input type="date" class="input" placeholder="00-0000">

                <h2>Indirizzo</h2>
                <input type="text" class="input" placeholder="via somestreet 0">

                <h2>Città</h2>
                <input type="text" class="input" placeholder="somecity">

                <button class="btn">Salva</button>
            </div>

            <div v-show="activeDiv === 2" class="terzo">
                <h1>Impostazioni sulla Privacy e sul Tuo Account</h1>

                <h2>Informativa sulla privacy</h2>
                <p>
                    1. Informazioni che raccogliamo
                    Raccogliamo informazioni personali quando utilizzi il nostro sito web di GalaxyCineVerse, acquisti biglietti o interagisci con i nostri servizi. 
                    Queste informazioni possono includere:

                    Nome e ulteriori informazioni personali,
                    Informazioni di contatto (email, numero di telefono),
                    Dettagli di pagamento,
                    Cronologia delle transazioni,
                    Altre informazioni fornite volontariamente.
                </p>
                <p>
                    2. Come utilizziamo le tue informazioni
                    Utilizziamo le informazioni raccolte per i seguenti scopi:

                    Elaborare acquisti e prenotazioni di biglietti,
                    Migliorare il nostro sito web e i nostri servizi,
                    Garantire la sicurezza del nostro sito web e prevenire frodi.
                </p>
                <p>
                    3. Sicurezza dei dati
                    Adottiamo misure ragionevoli per proteggere le tue informazioni personali da accessi non autorizzati, divulgazioni, alterazioni e distruzioni. 
                </p>
                <p>
                    4. Cookie e tecnologie di tracciamento
                    Utilizziamo cookie e tecnologie di tracciamento simili per migliorare la tua esperienza sul nostro sito web.
                </p>
                <p>
                    5. Contattaci
                    Se hai domande su questa informativa sulla privacy o sulle nostre pratiche relative ai dati, contattaci all'indirizzo " galaxycineverse@cinema.com ".
                    Utilizzando il nostro sito web, accetti i termini indicati in questa informativa sulla privacy.

                </p>
            </div>

            <div v-show="activeDiv === 3" class="quarto">
                <h1>La tua cronologia di acquisti</h1>                
                <table class="table table-striped table-bordered table-responsive border border-2 border border-dark">
                    <thead>
                        <tr>
                            <th>Titolo Film</th>
                            <th>Data proiezione film</th>
                            <th>Orario</th>
                            <th>Importo</th>
                            <th>Descrizione Sala</th>
                            <th>Tipo di pagamento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="entry in crono" :key="entry.idutente">
                            <td>{{ entry.titolo }}</td>
                            <td>{{ entry.datap.slice(0, 10) }}</td>
                            <td>{{ entry.orario.slice(0, 5) }}</td>
                            <td>{{ entry.importo }} €</td>
                            <td>{{ entry.descrizione }}</td>
                            <td>{{ entry.Descrizione }}</td>
                        </tr>  
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</template>



<style scoped>

body {
    background-color: #001C38;
    width: 100%;
}

h1, h2{
    margin-top: 5%;
    margin-bottom: 3%;
}

th, td{
    color: black;
    padding: 0;
    font-size: medium;
}

td{
    padding: 1%;
    width:20%;
}

table{
    display: inline-block;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    width: 100%;
}

#CONTAINER{
    background: #fff;
    width:100%;
    height:600px;
    margin:0 auto;
    position:relative;
    margin-top:10%;
    box-shadow: 2px 5px 20px rgba(119,119,119,.5);
}

#NavContainer{
    float:left;
    top:-5%;
    left:5%;
    position:absolute;
    width: 15%;
    height: 110%;
    background: rgb(22, 22, 226);
    box-shadow: 3px 3px 10px rgba(119,119,119,.5);
    border: .1em solid #fff;
}

#nav-profilo-utente > a {
    list-style:none;
    padding: 35px;
    color:#fff;
    font-size:1.1em;
    display: block;
    transition: all .3s ease-in-out;
}

#nav-profilo-utente > a:hover{
    color:#0d2f26;
    cursor: pointer;
    transform: scale(1.2);
}

#nav-profilo-utente > a:first-child{
    margin-top:7px;
}

#nav-profilo-utente > a.active{
    color:#0d2f26;
}

.primo, .secondo, .terzo, .quarto{
    width:60%;
    margin-left:25%;
}

.tab{
    transition: all .5s ease-in;
    width: 80%;
}

#CONTAINER > .primo, .secondo, .terzo > h1{
    font-family:Verdana, Geneva, Tahoma, sans-serif;
    font-size: 2.3rem;
    color:rgb(32, 54, 72);
    margin-top:40px;
    margin-bottom: 25px;
}

h2{
    color:rgb(22, 30, 37);
    font-family: Arial, Helvetica, sans-serif;
    text-transform: uppercase;
    font-size: 15px;
    letter-spacing: 1px;
    margin-left: 2px;
    margin-top:10px
}

.input, p{
    border:0;
    border-bottom: 1px solid #2c302f;
    width: 80%;
    font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    font-size: .7em;
    padding: 7px 0;
    color: #070707;
    outline: none;
}

.btn{
    font-family: Arial, Helvetica, sans-serif;
    text-transform: uppercase;
    font-size: 15px;
    border:0;
    color:#fff;
    background-color: #383e3c;
    padding: 7px 15px;
    box-shadow: 0px 2px 4px 0px rgba(0,0,0,.2);
    cursor:pointer;
    margin-top:15px
}

#contenitore{
    font-size: 22px;
}

.btn:hover{
    color: #fff;
}

section > h1{
    color: white;
    margin:2%;
    padding:0;
    background-color: #001C38;
    width: 100%;
}

footer{
    margin:0;
    padding:0;
}

p{
    font-size: 13px;
}


</style>