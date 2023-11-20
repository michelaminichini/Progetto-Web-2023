import { createApp } from "vue"
import {createRouter, createWebHistory, Router} from "vue-router"
//import './style.css'
import 'bootstrap'
import "bootstrap/dist/css/bootstrap.min.css"
import App from "./App.vue"
import Home from "./pages/Home.vue"
import Prossimamente from "./pages/Prossimamente.vue"
import InfoCinema from "./pages/Info.vue"
import Login from "./pages/Login.vue"

const router:Router = createRouter({
    history:createWebHistory(),
    routes: [
        { path: "/", component: Home },
        { path: "/prossimamente", component: Prossimamente },
        { path: "/info", component: InfoCinema },
        { path: "/login", component: Login }
    ]
})


createApp(App).use(router).mount("#app")
