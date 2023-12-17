import { createApp } from "vue"
import {createRouter, createWebHistory, Router} from "vue-router"
//import './style.css'
import "bootstrap"
import "bootstrap/dist/css/bootstrap.min.css"
import App from "./App.vue"
import Home from "./pages/Home.vue"
import Prossimamente from "./pages/Prossimamente.vue"
import InfoCinema from "./pages/Info.vue"
import Login from "./pages/Login.vue"
import SchedaFilm from "./pages/SchedaFilm.vue"
import PostiSala from "./pages/PostiSala.vue"
import Pagamento from "./pages/Pagamento.vue"
import PaginaAdmin from "./pages/PaginaAdmin.vue"
import SeatBooking from "./pages/SeatBooking.vue"
import UserProfile from "./pages/UserProfile.vue"
import Amministratore from "./pages/Amministratore.vue"

import Register from "./pages/Registrazione.vue"
import Profilo from "./pages/Profilo.vue"

import axios from "axios"
import { User } from "./types"


const router: Router = createRouter({
    history:createWebHistory(),
    routes: [
        { path: "/", component: Home },
        { path: "/prossimamente", component: Prossimamente },
        { path: "/info", component: InfoCinema },
        { path: "/login", component: Login},
        { path: "/register", component: Register},
        { path: "/film/:idfilm", component: SchedaFilm },
        //{ path: "/seatbooking", component: SeatBooking},
        { path: "/pagamento", component: Pagamento, meta: { requireLogin: true },},
        //{ path: "/paginaAdmin", component: PaginaAdmin},
        { path: "/paginaAdmin", component: PaginaAdmin},
        { path: "/PostiSala/:idproiezione", component: PostiSala, meta: { requireLogin: true }},
        { path: "/profiloutente", component: UserProfile, meta: { requireLogin: true },},
        { path: "/profilo", component: Profilo},
        { path: "/adminpage", component: Amministratore}
    ]
})



// Funzione che viene eseguita prima di ogni navigazione del router
router.beforeEach(async (to) => {
    const res = await axios.get("/api/auth/profile")
    const user = res.data as User | null
    console.log("User è:", res)
    // Se la pagina richiede il login, ma l'utente non l'ha effettuato, lo rimanda alla pagina di login
    if (to.meta.requireLogin && !user) {
      return { path: "/login" }
    }
    // Se la pagina richiede il logout, ma l'utente ha effettuato l'accesso, lo rimanda alla home
    if (to.meta.requireLogout && user) {
        return { path: "/" }
    }
})

//interface AppConfig {
//    globalProperties: Record<string, any>
//}

createApp(App).use(router).mount("#app");
//definizione di variabili globali
//app.config.globalProperties.$SeatList = 'ABCD';
//app.config.globalProperties.$CurrentProj = 123;


