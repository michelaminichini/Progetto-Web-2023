<script lang="ts">
import { defineComponent } from "vue"

export default defineComponent({
    data(){
        return {
            activeDiv: null,
        };
    },
    methods:{
        toggleDiv(index: any){
            this.activeDiv = this.activeDiv === index ? null: index;
        },
    },


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
                <h1>Informazioni personali</h1>
                <h2>Nome e Cognome</h2>
                <input type="text" class="input" placeholder="Jane Doe">

                <h2>Data di nascita</h2>
                <input type="text" class="input" placeholder="20 Aprile 1998">

                <h2>Email</h2>
                <input type="text" class="input" placeholder="example@example.com">

                <h2>Numero di Telefono</h2>
                <input type="text" class="input" placeholder="1111111111">

                <h2>Data creazione account</h2>
                <input type="date" class="input" placeholder="00-00-0000">

                <button class="btn">Salva</button>
    
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
        </div>
    </body>
</template>



<style scoped>

body {
    background-color: #001C38;
    width: 100%;
}

#CONTAINER{
    background: #fff;
    width:540px;
    height:500px;
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

.primo{
    width:60%;
    margin-left:27%;
}

.secondo{
    width:60%;
    margin-left:27%;
}

.terzo{
    width:60%;
    margin-left:27%;
}

.tab{
    transition: all .5s ease-in;
    width: 80%;
}

#CONTAINER > .primo > h1{
    font-family:Verdana, Geneva, Tahoma, sans-serif;
    font-size: 2.3rem;
    color:rgb(32, 54, 72);
    margin-top:40px;
    margin-bottom: 25px;
}

#CONTAINER > .secondo > h1{
    font-family:Verdana, Geneva, Tahoma, sans-serif;
    font-size: 2.3rem;
    color:rgb(32, 54, 72);
    margin-top:40px;
    margin-bottom: 25px;
}

#CONTAINER > .terzo > h1{
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