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

const router: Router = createRouter({
    history:createWebHistory(),
    routes: [
        { path: "/", component: Home },
        { path: "/prossimamente", component: Prossimamente },
        { path: "/info", component: InfoCinema },
        { path: "/login", component: Login },
        { path: "/film/:idfilm", component: SchedaFilm },
        { path: "/seatbooking/:idproiezione", component: SeatBooking},
        { path: "/pagamento", component: Pagamento},
        { path:"/paginaAdmin", component: PaginaAdmin}
    ]
})


createApp(App).use(router).mount("#app")
