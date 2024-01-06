import { createApp } from "vue"
import {createRouter, createWebHistory, Router} from "vue-router"
import "bootstrap"
import "bootstrap/dist/css/bootstrap.min.css"
import axios from "axios"

import App from "./App.vue"
import Home from "./pages/Home.vue"
import Prossimamente from "./pages/Prossimamente.vue"
import InfoCinema from "./pages/Info.vue"
import Login from "./pages/Login.vue"
import SchedaFilm from "./pages/SchedaFilm.vue"
import PostiSala from "./pages/PostiSala.vue"
import Pagamento from "./pages/Pagamento.vue"
import UserProfile from "./pages/UserProfile.vue"
import Amministratore from "./pages/Amministratore.vue"
import Pannello2 from "./pages/Pannello2admin.vue"
import Registrazione from "./pages/Registrazione.vue"
import Profilo from "./pages/Profilo.vue"
import EditFilm from "./pages/EditFilm.vue"

import { User } from "./types"


const router: Router = createRouter({
    history:createWebHistory(),
    routes: [
        { path: "/", component: Home },
        { path: "/prossimamente", component: Prossimamente },
        { path: "/info", component: InfoCinema },
        { path: "/login", component: Login},
        { path: "/register", component: Registrazione},
        { path: "/film/:idfilm", component: SchedaFilm },
        { path: "/pagamento", component: Pagamento, meta: { requireLogin: true },}, // per accedervi, è necessario effettuare prima il login
        { path: "/PostiSala", component: PostiSala, meta: { requireLogin: true }}, // per accedervi, è necessario effettuare prima il login
        { path: "/profiloutente", component: UserProfile, meta: { requireLogin: true },}, // per accedervi, è necessario effettuare prima il login
        { path: "/profilo", component: Profilo},
        { path: "/adminpage", component: Amministratore, meta: { requireLogin: true }}, // per accedervi, è necessario effettuare prima il login
        { path: "/pannello2", component: Pannello2, meta: { requireLogin: true }}, // per accedervi, è necessario effettuare prima il login
        { path: "/editfilm/:idfilm", component: EditFilm},
    ]
})



// Funzione che viene eseguita prima di ogni navigazione del router
router.beforeEach(async (to) => {
    const res = await axios.get("/api/auth/profile")
    const user = res.data as User | null
    console.log("User è:", res)
    // Se la pagina richiede il login, ma l'utente non l'ha effettuato, lo rimanda alla pagina profilo, in cui può scegliere se registrarsi o effetturare il login
    if (to.meta.requireLogin && !user) {
      return { path: "/profilo" }
    }
    // Se la pagina richiede il logout, ma l'utente ha effettuato l'accesso, lo rimanda alla home
    if (to.meta.requireLogout && user) {
        return { path: "/" }
    }
    //if (to.meta.requireAdmin && user?.ruolo == "acquirente") {
    //   return { path: "/"}
    //}
})

createApp(App).use(router).mount("#app");



