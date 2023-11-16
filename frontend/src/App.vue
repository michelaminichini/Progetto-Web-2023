<template>
  <header>
    <h1>GalaxyCineVerse</h1>
  </header>
  <nav>
    <ul>
      <li><router-link to="/">Home</router-link></li>
    </ul>
  </nav>

  <main>
    <RouterView />
  </main>


  <footer>
    <p>Ingegneria dei Sistemi Web - A.A. 2023/2024</p>
  </footer>


</template>


<style scoped>
.router-link-exact-active {
  color: rgb(219, 69, 83);
  background-color: #fff;
}

</style>