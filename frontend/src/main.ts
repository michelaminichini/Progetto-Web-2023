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

import axios from "axios"
import { User } from "./types"

import ProvaGiulia from "./pages/provaGiulia.vue"
import EditFilm from "./pages/EditFilm.vue"

const router: Router = createRouter({
    history:createWebHistory(),
    routes: [
        { path: "/", component: Home },
        { path: "/prossimamente", component: Prossimamente },
        { path: "/info", component: InfoCinema },
        { path: "/login", component: Login },
        { path: "/film/:idfilm", component: SchedaFilm },
        { path: "/seatbooking", component: SeatBooking},
        { path: "/pagamento", component: Pagamento},
        { path:"/paginaAdmin", component: PaginaAdmin},
        { path: "/PostiSala/:idproiezione", component: PostiSala},
        { path: "/provaGiulia", component: ProvaGiulia}
    ]
})


/*
// Funzione che viene eseguita prima di ogni navigazione del router
router.beforeEach(async (to) => {
    const res = await axios.get("/api/auth/profile")
    const user = res.data as User | null
    // Se la pagina richiede il login, ma l'utente non l'ha effettuato, lo rimanda alla pagina di login
    if (to.meta.requireLogin && !user) {
      return { path: "/login" }
    }
})

*/
createApp(App).use(router).mount("#app")
