<template>
  <header>
    <h1>GalaxyCineVerse</h1>
  </header>
  <body>

    <nav>
      <ul>
        <li><router-link to="/">Home</router-link></li>
      </ul>
    </nav>

    <main>
      <RouterView />
    </main>

  </body>

  <footer>
    <p>Ingegneria dei Sistemi Web - A.A. 2023/2024</p>
  </footer>

</template>


<style scoped>
@import "./styles/style.scss";
</style>