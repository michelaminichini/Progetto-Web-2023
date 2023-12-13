<script lang="ts">
import axios from "axios"
import { PropType, defineComponent } from "vue"
import { User } from "../types"
import UserInfo from "../components/user-info.vue"
import { CronoUtente } from "../types";
import { UpdateUser } from "../types";

export default defineComponent({
   /*  props: {
        user: Object as PropType<User>,
    }, */
    //components: { UserInfo },
    data(){
        return {
            activeDiv: null,
            //userHistory: [] as CronoUtente [],
            crono: [] as CronoUtente [],
            user: null as User | null,
            utenteAggiornato: [] as UpdateUser [],
        };
    },
    
    methods:{
        toggleDiv(index: any){
            this.activeDiv = this.activeDiv === index ? null: index;
        },
        //async getuser(){
          //  const res = await axios.get("/api/auth/profile")
            //this.user = res.data
            //console.log(this.user)
        //},
        
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
        
        async updateUserProfile(){
            const response = await axios.get("/api/auth/profile")
            this.user = response.data
            console.log(this.user)
            const ID = this.user?.idutente
            console.log("Id "+ID)
            const risposta = await axios.put("/api/update/aggiornaDati/"+ID)
            this.utenteAggiornato = risposta.data
            console.log(this.utenteAggiornato)

            // const updateData = {
            //     nome: this.nome,
            //     congome: this.cognome,
            //     telefono: this.telefono,
            //     data_nascita: this.data_nascita
            // }
            // try {
            //     //console.log('Data sent in request:', {
            //        // nome: this.nome,
            //         //cognome: this.cognome,
            //         //telefono: parseInt(this.telefono),
            //         //data_nascita: this.data_nascita,
            //     //})
            //     const risposta = await axios.put("/api/update/aggiornaDati" , updateData)
            //     window.location.href = "/profiloutente"
            //     console.log("RISPOSTA:", risposta.data)

            //     //this.user = risposta.data

            //     //console.log("Risposta:", risposta)
            // } catch (e: any) {
            //   if (e.response) {
            //       alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
            //   } else {
            //       alert(e.message)
            //   }   
            // }
        },
    },
    mounted(){
        this.getCronologia()
        //this.updateUserProfile()
    }
})
</script>

<template>
    <head>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <section>
            <h1>Impostazioni Profilo Personale</h1>
        </section>
        <div id="CONTAINER" class="container">
            <div id="NavContainer" class="nav-container">
                <nav id="nav-profilo-utente">
                    <a class="tab active" @click="toggleDiv(0)">
                        <i class="glyphicon glyphicon-user"></i>
                    </a>
                    <a class="tab" @click="toggleDiv(1)">
                        <i class="glyphicon glyphicon-credit-card"></i>
                    </a>
                    <a class="tab" @click="toggleDiv(2)">
                        <i class="glyphicon glyphicon-cog"></i> 
                    </a>
                    <a class="tab" @click="toggleDiv(3)">
                        <i class="glyphicon glyphicon-time"></i> 
                    </a>
                </nav>
            </div>

            <div v-show="activeDiv === 0" class="primo">
                <form v-for="dato in utenteAggiornato" :key="dato.idutente">
                    
                    <h1>Informazioni personali</h1>

                    <h2>Nome</h2>
                    <input type="text" v-model="dato.nome" class="rounded-lg border-slate-200" placeholder="Nome" required>

                    <h2>Cognome</h2>
                    <input type="text" v-model="dato.cognome" class="rounded-lg border-slate-200" placeholder="Cognome" required>

                    <h2>Numero di Telefono</h2>
                    <input type="number" v-model="dato.telefono" class="rounded-lg border-slate-200" placeholder="1111111111" required>

                    <h2>Data di nascita</h2>
                    <input type="date" v-model="dato.data_nascita" class="rounded-lg border-slate-200" required>

                    <button class="btn text-white w-1/2 mx-auto mt-3" @click="updateUserProfile">Salva</button>
                </form>
                    
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

                <!--button class="btn">Salva</button-->
            </div>

            <div v-show="activeDiv === 3" class="quarto">
                <h1 style="margin-bottom: 5%;">La tua cronologia di acquisti</h1>                
                <table>
                    <thead>
                        <tr>
                            <th>Titolo Film</th>
                            <th>Data proiezione film</th>
                            <th>Orario proiezione film</th>
                            <th>Importo</th>
                            <th>Descrizione Sala</th>
                            <th>Tipo di pagamento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="entry in crono" :key="entry.idutente">
                            <td>{{ entry.titolo }}</td>
                            <td>{{ entry.datap }}</td>
                            <td>{{ entry.orario }}</td>
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

th, td{
    color: black;
    padding: 0;
    font-size: medium;

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
    font-size: 14px;
}


</style>