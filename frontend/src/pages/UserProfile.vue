<script lang="ts">
import axios from "axios"
import { defineComponent } from "vue"
import { User } from "../types"
import { DatiUtente } from "../types";
import { CronoUtente } from "../types";
import { UpdateUser } from "../types";
import dayjs, { Dayjs } from "dayjs";

export default defineComponent({
    data(){
        return {
            activeDiv: null,
            crono: [] as CronoUtente [],
            user: null as User | null,
            utenteAggiornato: [] as UpdateUser [],
            datiUtente: [] as DatiUtente [],
            editmode: false,
            dataN: dayjs() as Dayjs,
            dataE: "",
            isPopupOpen: false,
        };
      
    },
    
    methods:{
        formatDateTime(data: string): string{
            console.log(this.dataE)
            return dayjs(data).format('DD-MM-YYYY'); // Example: Formatting date using Day.js
        },
        selectAll: function (event: Event) {
            setTimeout(function () {
                const target = event.target as HTMLInputElement;
                target!.select();
            }, 0);
        },

        edit: function() {
            this.editmode = !this.editmode;
        },
        
        toggleDiv(index: any){
            this.activeDiv = this.activeDiv === index ? null: index;
        },
        
        async getCronologia(){ 
            const res = await axios.get("/api/auth/profile")
            this.user = res.data
            console.log(this.user) 
            const id = this.user?.idutente                    
            console.log("Id "+id)
            const res1 = await axios.get("/api/cronologia/"+id)
            this.crono = res1.data
            console.log(this.crono)
        },

        async getDatiUtente(){
            const res = await axios.get("/api/auth/profile")
            this.user = res.data
            console.log(this.user) 
            const id = this.user?.idutente                    
            console.log("Id "+id)
            const res1 = await axios.get("/api/leggiutente/"+ id)
            this.datiUtente = res1.data
            console.log(this.datiUtente)
            this.dataE = dayjs(this.datiUtente[0].data_nascita).format('DD-MM-YYYY')
            console.log(this.dataE)
        },

        async updateDatiUtente(){
            const datiU = this.datiUtente
            datiU[0].data_nascita = dayjs(this.dataE).format('YYYY-MM-DD')
            console.log(datiU)
            axios.put("/api/aggiornautente", datiU)
            .then(response => {console.log(response.data)})
            this.dataE=dayjs(datiU[0].data_nascita).format('DD-MM-YYYY');
            this.editmode = false
        },

        // Pop-up window viene aperta o chiusa in base allo stato della variabile isPopupOpen
        openPopup() {
            this.isPopupOpen = true;
        },
        closePopup() {
            this.isPopupOpen = false;
        }
    },
    mounted(){
        this.getCronologia()
        this.getDatiUtente()
        
    }
})
</script>

<template>
    <body>
        <section>
            <h1>Impostazioni Profilo Personale</h1>
        </section>
        <div id="CONTAINER" class="container">
            <div id="NavContainer" class="nav-container">
                <nav id="nav-profilo-utente">
                    <a class="tab active" @click="toggleDiv(0)">
                        <i>
                            <img src="/user-icon.png" alt="Logo" width="30" height="30">
                        </i>
                    </a>
                    <a class="tab" @click="toggleDiv(1)">
                        <i>
                            <img src="/shield-lock-line-icon.png" alt="Logo" width="30" height="30">
                        </i> 
                    </a>
                    <a class="tab" @click="toggleDiv(2)">
                        <i>
                            <img src="/clock-rotate-left-icon.png" alt="Logo" width="30" height="30">
                        </i> 
                    </a>
                </nav>
            </div>

            <div v-show="activeDiv === 0" class="primo">
                  
                <div v-for= "utente in datiUtente" :key="utente.idutente" id="contenitore" class="row">
                    <h1>Informazioni personali</h1>
                    <h2>Se i dati inseriti al momento della registrazione non sono corretti, puoi modificarli qui</h2>
                    <div v-if="editmode">
                        Nome: 
                        <input v-model="utente.nome">
                    </div>
                    <div v-else>Nome: {{utente.nome}}</div>
                    <div v-if="editmode">
                        Cognome: 
                        <input v-model="utente.cognome">
                    </div>
                    <div v-else>Cognome: {{utente.cognome}}</div>
                    <div class="inputBox">
                        <div v-if="editmode">
                            <span>Data di nascita</span>
                            <input 
                            v-model="utente.data_nascita"
                            type="date"
                            class="rounded-lg border-slate-200"
                            placeholder="data di nascita"
                            />
                        </div>
                        <div v-else>Data di nascita: {{formatDateTime(utente.data_nascita)}}</div>
                    </div>
                    <div v-if="editmode">
                        Telefono: 
                        <input v-model="utente.telefono" placeholder="numero di telefono">
                    </div>
                    <div v-else>Telefono: {{utente.telefono}}</div>
                    <div>
                        <button v-on:click="edit()" class="btn btn-danger">edit</button>
                    
                        <button type="button" v-on:click="updateDatiUtente()" class="btn btn-danger"  @click="openPopup">save</button>
                        <dialog :open="isPopupOpen">
                            <p>Modifiche effettuate con successo!</p>
                            <button @click="closePopup">Chiudi</button>
                        </dialog>
                        
                    </div>                          
                </div>
            </div>

            <div v-show="activeDiv === 1" class="secondo">
                <h1>Informativa sulla privacy</h1>
                <div id="testo" class="overflow-auto">
                    <p>
                        1. Raccogliamo informazioni personali quando utilizzi il nostro sito web di GalaxyCineVerse, acquisti biglietti o interagisci con i nostri servizi. 
                        Queste informazioni possono includere:

                        Nome e ulteriori informazioni personali,
                        Informazioni di contatto (email, numero di telefono),
                        Dettagli di pagamento,
                        Cronologia delle transazioni,
                        Altre informazioni fornite volontariamente.
                    </p>
                    <p>
                        2. Utilizziamo le informazioni raccolte per i seguenti scopi:

                        Elaborare acquisti e prenotazioni di biglietti,
                        Migliorare il nostro sito web e i nostri servizi,
                        Garantire la sicurezza del nostro sito web e prevenire frodi.
                    </p>
                    <p>
                        3. Adottiamo misure ragionevoli per proteggere le tue informazioni personali da accessi non autorizzati, divulgazioni, alterazioni e distruzioni. 
                    </p>
                    <p>
                        4. Utilizziamo cookie e tecnologie di tracciamento simili per migliorare la tua esperienza sul nostro sito web.
                    </p>
                    <p>
                        5. Se hai domande su questa informativa sulla privacy o sulle nostre pratiche relative ai dati, contattaci all'indirizzo " galaxycineverse@cinema.com ".
                        Utilizzando il nostro sito web, accetti i termini indicati in questa informativa sulla privacy.
                    </p>
                </div>
                
            </div>

            <div v-show="activeDiv === 2" class="terzo">
                <h1>La tua cronologia di acquisti</h1>                
                <table id="cronologia" class="table table-striped table-bordered table-responsive border border-2 border border-dark overflow-auto">
                    <thead>
                        <tr>
                            <th>Titolo Film</th>
                            <th>Data proiezione film</th>
                            <th>Orario</th>
                            <th>Importo</th>
                            <th>Descrizione Sala</th>
                            <th>Tipo di pagamento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="entry in crono" :key="entry.idutente">
                            <td>{{ entry.titolo }}</td>
                            <td>{{ entry.datap.slice(0, 10) }}</td>
                            <td>{{ entry.orario.slice(0, 5) }}</td>
                            <td>{{ entry.importo }} €</td>
                            <td>{{ entry.descrizione }}</td>
                            <td>{{ entry.Descrizione }}</td>
                        </tr>  
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</template>

<style scoped>
@import "../styles/user-profile-page.scss"
</style>