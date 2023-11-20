<template>
  <header>
    <h1>GalaxyCineVerse</h1>
  </header>
  <body>
     
    <!-- <nav>
        <ul>
          <li id="logo"><img  :src="'/img/logo2.png'" alt=""/></li>
          <li><router-link to="/">Home</router-link></li>
          <li><router-link to="/prossimamente">Prossimamente</router-link></li>
          <li><router-link to="/info">Info Cinema</router-link></li>
          <li id="login"><router-link to="/login">LOGIN</router-link></li>
        </ul>
      </nav> -->
    

  
<nav class="navbar navbar-expand-lg bg-light">
  <div id="nav" class="container-fluid">
    <a class="navbar-brand" href="#"><img src="/img/ImmLogo.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top"></a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link class="nav-link" aria-current="page" to="/">Home</router-link>
        </li>
        <li class="nav-item">
          <router-link class="nav-link" to="/prossimamente">Prossimamente</router-link>
        </li>
        <li class="nav-item">
          <router-link class="nav-link" to="/info">Info Cinema</router-link>
        </li>
      </ul>
    </div>
        <form class="d-flex">
            <router-link to="/login"><button class="btn btn-outline-danger">LOGIN</button></router-link>
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
</style>

<!-- <style>
@import "-/styles/style.css";
</style> -->