<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"
import UserInfo from "../components/user-info.vue"
import { CronoUtente } from "../types";

export default defineComponent({
    //components: { UserInfo },
    data(){
        return {
            activeDiv: null,
            crono: [] as CronoUtente []
        };
    },
    
    methods:{
        toggleDiv(index: any){
            this.activeDiv = this.activeDiv === index ? null: index;
        },
        getCronologia(){
            axios.get("/api/cronologia").then(response => this.crono = response.data)
        }
        /*
        async updateUserProfile(){
            const updateData = {
                email:this.email,
                nome: this.nome,
                congome: this.cognome,
                telefono: this.telefono,
                data_nascita: this.data_mascita
            }
            try {
                //console.log('Data sent in request:', {
                   // nome: this.nome,
                    //cognome: this.cognome,
                    //telefono: parseInt(this.telefono),
                    //data_nascita: this.data_nascita,
                //})
                const risposta = await axios.put("/api/update/aggiornaDati" , updateData)
                window.location.href = "/profiloutente"
                console.log("RISPOSTA:", risposta.data)

                //this.user = risposta.data

                //console.log("Risposta:", risposta)
            } catch (e: any) {
              if (e.response) {
                  alert(`${e.response.status} - ${e.response.statusText}\n${e.response.data}`)
              } else {
                  alert(e.message)
              }   
            }
        },*/
    },
    mounted(){
        //this.updateUserProfile()
        this.getCronologia()
    }
})
</script>

<template>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
                <!--form>
                    
                    <h1>Informazioni personali</h1>

                    <h2>Email</h2>
                    <input type="text" v-model="email" class="rounded-lg border-slate-200" placeholder="Nome" required>

                    <h2>Nome</h2>
                    <input type="text" v-model="nome" class="rounded-lg border-slate-200" placeholder="Nome" required>

                    <h2>Cognome</h2>
                    <input type="text" v-model="cognome" class="rounded-lg border-slate-200" placeholder="Cognome" required>

                    <h2>Numero di Telefono</h2>
                    <input type="number" v-model="telefono" class="rounded-lg border-slate-200" placeholder="1111111111" required>

                    <h2>Data di nascita</h2>
                    <input type="date" v-model="data_mascita" class="rounded-lg border-slate-200" required>

                    <button class="btn text-white w-1/2 mx-auto mt-3" @click="updateUserProfile">Salva</button>
                </form-->
                    
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
                <h2>Gestisce notifiche email</h2><p></p>
                        
                <h2>Gestisci impostazioni sulla privacy</h2><p></p>

                <h2>Vedi Termini e Condizioni</h2><p></p>
                        
                <h2>Personalized Ad Experience</h2><p></p>

                <h2>Preoteggi il tuo account</h2><p></p>

                <button class="btn">Salva</button>
            </div>

            <div v-show="activeDiv === 3" class="quarto">
                <h1>La tua cronologia di acquisti</h1>
                <table>
                    <thead>
                        <th>CIAO</th>
                        <th>CIAO</th>
                        <th>CIAO</th>
                        <th>CIAO</th>
                    </thead>
                    <tbody>
                        <td>CIAO</td>
                    </tbody>

                </table>

                <button class="btn">Salva</button>
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

}

#CONTAINER{
    background: #fff;
    width:900px;
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


</style>