<template>
  <header>
    <h1>GalaxyCineVerse</h1>
  </header>
  <body>
            
    <nav class="navbar navbar-expand-lg bg-transparent">
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
            <li class="nav-item">
              <router-link class="nav-link" to="/admin">Admin Page</router-link>
            </li>
          </ul>
        </div>
            <form class="d-flex">
                <router-link to="/login"><button class="btn btn-lg btn-primary">LOGIN</button></router-link>
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