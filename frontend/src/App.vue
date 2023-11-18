<template>
  <header>
    <h1>GalaxyCineVerse</h1>
  </header>
  <body>
    <div>
      <nav>
        <ul>
          <li id="logo"><img style="height: 35px; width: 175px;" :src="'/img/logo2.png'" alt=""/></li>
          <li><router-link to="/">Home</router-link></li>
          <li><router-link to="/prossimamente">Prossimamente</router-link></li>
          <li><router-link to="/info">Info Cinema</router-link></li>
          <li id="login"><router-link to="/login">LOGIN</router-link></li>
        </ul>
      </nav>
    </div>
           
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