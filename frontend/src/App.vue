<script lang="ts">
import { defineComponent } from 'vue';
import axios from "axios"

export default defineComponent({
  data() {
    return {
      isMobileNavOpen: true, // inizialmente settato a true
      admin: false,
    }
  },
  mounted() {
    this.updateMobileNavState();

    // Ascolto i window resize events per aggiornare isMobileNavOpen
    window.addEventListener('resize', this.updateMobileNavState);

    // Controllo se la media query è inizialmente attiva
    this.logMediaQueryStatus();

    // Ascolto i window resize events per registrare le modifiche dello stato delle media query 
    window.addEventListener('resize', this.logMediaQueryStatus);

    //this.admin = sessionStorage.getItem('isAdmin')+""
    if (sessionStorage.getItem('isAdmin') == null)
    {
      this.admin = false;
    } else{
      this.admin = true;
    }

    console.log("Admin M:",this.admin)
  },
  beforeDestroy() {
    // Rimuovo il resize event listener per evitare perdite di memoria
    window.removeEventListener('resize', this.updateMobileNavState);
    axios.post("/api/auth/logout")
    sessionStorage.setItem('isAdmin','')
    sessionStorage.setItem('utente','')
    sessionStorage.setItem('proiezione','')
  },
  methods: {
    updateMobileNavState() {
      // Controllo la grandezza della window e aggiorno il valore di isMobileNavOpen
     
      if (window.innerWidth <= 600){
        this.isMobileNavOpen = false
      } else if(window.innerWidth > 600){
        this.isMobileNavOpen = true
      }
    },
    toggleMobileNav() {
      this.isMobileNavOpen = !this.isMobileNavOpen;
      console.log('isMobileNavOpen:', this.isMobileNavOpen);
    },
    // Controllo errori nella console log
    logMediaQueryStatus() {
      const isMediaQueryActive = window.matchMedia('(max-width: 600px)').matches;

      if (isMediaQueryActive) {
        console.log('Media query è attiva');
      } else {
        console.log('Media query non è attiva');// Se la window è più grande di 600
      }
    },
  
  },
  //aggiorno la variabile locale admin dal session storage ad ogni cambio di rotta
  watch: { '$route' () {
      if (sessionStorage.getItem('isAdmin') == null)
      {
        this.admin = false;
      } else{
        this.admin = true;
      }
        console.log("Admin :", this.admin)
    }
  },
})

</script>

<template>
  <header>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link href='https://fonts.googleapis.com/css?family=Monoton' rel='stylesheet'>

    <h1 data-text="GalaxyCineVerse">GalaxyCineVerse</h1>
  </header>
  
  <body> 
    <nav class="navbar navbar-expand-lg bg-transparent">
      <div id="nav" class="container-fluid">
        <a title="GalaxyCineverse" class="navbar-brand" href="http://localhost:5173/">
          <img src="/logocinema3.png" alt="Logo" id="logo" width="30px" height="20" class="d-inline-block align-text-bottom">
        </a>
        <div id="navbarNav" class="d-flex" style="margin-right: 50%;">
          <i class="fas fa-bars mobile-nav-icon" @click="toggleMobileNav" style="font-size:36px; color:white"></i>
          <ul :style="{ display: isMobileNavOpen ? 'flex' : 'none' }">
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" aria-current="page" to="/">Programmazione</router-link>
            </li>
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" to="/prossimamente">Prossimamente</router-link>
            </li>
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" to="/info">Info</router-link>
            </li>
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" to="/adminpage" v-if="admin" >Pannello1</router-link>
            </li>
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" to="/pannello2" v-if="admin" >Pannello2</router-link>
            </li>
          </ul>
        </div>
            <form class="d-flex" style="margin-right: 20%;">
                <router-link to="/profilo"><button id="bottone-login" class="btn btn-lg btn-primary">LOGIN</button></router-link>
            </form>
        </div>
    </nav> 

    <main>
      <RouterView />
    </main>

  </body>

  <footer>
    <p>Ingegneria dei Sistemi Web - A.A. 2023/2024</p>
  </footer>

</template>


<style>
@import "./styles/style.scss";

@media only screen and (max-width: 600px) {
  nav{
    display: block;
    background-color: #333;
    position: absolute;
    z-index: 1;
  }

  ul {
    flex-direction: column;
    position: absolute;
    top: 60px;
    left: 0;
    background-color: #333;
    width: 100%;
  }

  li {
    margin: 10px 0;
  }

}

@media screen and (min-width: 800px) {
  header > h1 {
    font-size: 80px;
  }

  header > h1::before {
    line-height: 1.1;
  }

  #logo {
    width: 100px ;
    height: 80px;
  }
}

@media screen and (max-width: 799px){
  header > h1::before{
    line-height: 1.1;
  }
}

@media screen and (min-width: 1000px){
  header > h1::before{
    line-height: 1.2;
  }
}





</style>
