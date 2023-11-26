import { createApp } from "vue"
import {createRouter, createWebHistory, Router} from "vue-router"
//import './style.css'
import "bootstrap"
import "bootstrap/dist/css/bootstrap.min.css"
import App from "./App.vue"
import Home from "./pages/Home.vue"
import Prossimamente from "./pages/Prossimamente.vue"
import InfoCinema from "./pages/Info.vue"
import Admin from "./pages/Admin.vue"
import Login from "./pages/Login.vue"
import SchedaFilm from "./pages/SchedaFilm.vue"
import SeatBooking from "./pages/SeatBooking.vue"
<<<<<<< HEAD
import Pagamento from "./pages/Pagamento.vue"
=======
import PostiSala from "./pages/PostiSala.vue"

>>>>>>> bf5968e6b781895a0e288d1a605961971d302964

const router: Router = createRouter({
    history:createWebHistory(),
    routes: [
        { path: "/", component: Home },
        { path: "/prossimamente", component: Prossimamente },
        { path: "/info", component: InfoCinema },
        { path: "/admin", component: Admin},
        { path: "/login", component: Login },
        { path: "/film/:idfilm", component: SchedaFilm },
<<<<<<< HEAD
        { path: "/seatbooking/:idproiezione", component: SeatBooking},
        { path: "/pagamento", component: Pagamento}
=======
        { path: "/seatbooking", component: SeatBooking},
        { path: "/sala/:idproiezione", component: PostiSala}
>>>>>>> bf5968e6b781895a0e288d1a605961971d302964
    ]
})


createApp(App).use(router).mount("#app")
