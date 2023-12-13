<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  data() {
    return {
      isMobileNavOpen: true,
    }
  },
  mounted() {
    // Set isMobileNavOpen to false initially
    //this.isMobileNavOpen = false;
    
    // Check the screen width and update isMobileNavOpen
    this.updateMobileNavState();
    
    // Listen for window resize events to update isMobileNavOpen
    window.addEventListener('resize', this.updateMobileNavState);

    //this.isMobileNavOpen = window.innerWidth <= 600;
    // Check if the media query is active initially
    this.logMediaQueryStatus();

    // Listen for window resize events to log changes in media query status
    window.addEventListener('resize', this.logMediaQueryStatus);
  },
  beforeDestroy() {
    // Remove the resize event listener to avoid memory leaks
    window.removeEventListener('resize', this.updateMobileNavState);
  },
  methods: {
    updateMobileNavState() {
      // Check the screen width and update isMobileNavOpen
     
      if (window.innerWidth <= 600){
        this.isMobileNavOpen = false
      } else if(window.innerWidth > 600){
        this.isMobileNavOpen = true
      }
    },
    toggleMobileNav() {
      //console.log('Clicked');
      this.isMobileNavOpen = !this.isMobileNavOpen;
      console.log('isMobileNavOpen:', this.isMobileNavOpen);
    },
    // Checks for errors in the console log
    logMediaQueryStatus() {
    const isMediaQueryActive = window.matchMedia('(max-width: 600px)').matches;

    if (isMediaQueryActive) {
      console.log('Media query is active');
    } else {
      console.log('Media query is not active');// if it is more than 600
    }
  },
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

    <h1>GalaxyCineVerse</h1>
  </header>
  
  <body> 
    <nav class="navbar navbar-expand-lg bg-transparent">
      <div id="nav" class="container-fluid">
        <a title="GalaxyCineverse" class="navbar-brand" href="http://localhost:5173/">
          <img src="/ImmLogo.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
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
              <router-link class="nav-link" to="/seatbooking">SeatBooking</router-link>
            </li> 
            <!--li class="nav-item">
              <router-link class="nav-link" to="/pagamento">Pagamento</router-link>
            </li-->
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" to="/paginaAdmin">Pagina Admin</router-link>
            </li>
            <li class="nav-item" style="margin-right: 5%;">
              <router-link class="nav-link" to="/provaGiulia">Prova Giulia</router-link>
            </li>
          </ul>
        </div>
            <form class="d-flex" style="margin-right: 5%;">
                <router-link to="/profilo"><button class="btn btn-lg btn-primary">LOGIN</button></router-link>
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
  }

  ul {
    flex-direction: column;
    position: absolute;
    top: 60px; /* Adjust as needed */
    left: 0;
    background-color: #333;
    width: 100%;
  }

  li {
    margin: 10px 0;
  }
}



</style>
