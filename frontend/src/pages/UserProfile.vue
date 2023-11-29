<!--
<script lang="ts">
    //<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    const tabBtn = document.querySelectorAll(".tab");
    const tab = document.querySelectorAll(".tabShow");

    function tabs(panelIndex){
        tab.forEach(function(node){
            node.style.display = "none";
        });
        tab[panelIndex].style.display = "block";
        
    }
    tabs(0)

</script>
-->


<template>
    <head>
        <title>Impostazioni Profilo Personale</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container">
            <div class="leftbox">
                <nav>
                    <a onclick="tabs(0)" class="tab active">
                        <i class="glyphicon glyphicon-user"></i> <!--INFORMAZIONI GENERALI SULL'UTENTE-->
                    </a>
                    <a onclick="tabs(1)" class="tab">
                        <i class="glyphicon glyphicon-credit-card"></i>
                    </a>
                    <a onclick="tabs(2)" class="tab">
                        <i class="glyphicon glyphicon-cog"></i> <!--IMPOSTAZIONI PROFILO-->
                    </a>
                    <a onclick="tabs(3)" class="tab">
                        <i class="glyphicon glyphicon-time"></i> <!--CRONOLOGIA BIGLIETTI ACQUISTATI-->
                    </a>
                </nav>
            </div>

            <div class="rigthbox">
                <div class="profile tabShow">
                    <h1>Informazioni personali</h1>
                    <h2>Nome e Cognome</h2>
                    <input type="text" class="input" placeholder="Jane Doe">

                    <h2>Data di nascita</h2>
                    <input type="text" class="input" placeholder="20 Aprile 1998">

                    <h2>Email</h2>
                    <input type="text" class="input" placeholder="example@example.com">

                    <h2>Numero di Telefono</h2>
                    <input type="text" class="input" placeholder="1111111111">

                    <h2>Password</h2>
                    <input type="password" class="input" placeholder="xxxxxxxxxx">

                    <h2>Data creazione account</h2>
                    <input type="date" class="input" placeholder="00-00-0000">

                    <button class="btn">Salva</button>
                </div>
                <div class="payment tabShow">
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

                <!--QUI INSERIRE PER CREAZIONE CRONOLOGIA-->

                <div class="privacy and settings tabShow">
                    <h1>Impostazioni sulla Privacy e sul Tuo Account</h1>
                    <h2>Gestisce notifiche email</h2><p></p>
                    
                    <h2>Gestisci impostazioni sulla privacy</h2><p></p>

                    <h2>Vedi Termini e Condizioni</h2><p></p>
                    
                    <h2>Personalized Ad Experience</h2><p></p>

                    <h2>Preoteggi il tuo account</h2><p></p>

                    <button class="btn">Salva</button>
                </div>
                
            </div>



        </div>

        
        
        
        

    </body>

</template>

<style scoped>
*{
    margin:0;
    padding:0;
}

body {
    /*background-color: linear-gradient(to right, rgb(40, 20, 173), rgb(9, 9, 103) 36, 249);*/
    overflow-x:hidden;
}

.container{
    background: #fff;
    width:540px;
    height:450px;
    margin:0 auto;
    position:relative;
    margin-top:10%;
    box-shadow: 2px 5px 20px rgba(119,119,119,.5);
}

.leftbox{
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

nav a {
    list-style:none;
    padding: 35px;
    color:#fff;
    font-size:1.1em;
    display: block;
    transition: all .3s ease-in-out;
}

nav a:hover{
    color:#0d2f26;
    cursor: pointer;
    transform: scale(1.2);
}

nav a:first-child{
    margin-top:7px;
}

nav a.active{
    color:#0d2f26;
}

.rightbox{
    width:60%;
    margin-left: 27%;
}

.tab{
    transition: all .5s ease-in;
    width: 80%;
}

h1{
    font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    font-size: 1.2rem;
    color:rgb(32, 54, 72);
    margin-top:40px;
    margin-bottom: 35px;
}

h2{
    color:rgb(54, 79, 98);
    font-family: Arial, Helvetica, sans-serif;
    text-transform: uppercase;
    font-size: 8px;
    letter-spacing: 1px;
    margin-left: 2px;
    margin-top:10px
}

.input, p{
    border:0;
    border-bottom: 1px solid #3fb6a8;
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

.tabShow{
    display:none;
}


</style>