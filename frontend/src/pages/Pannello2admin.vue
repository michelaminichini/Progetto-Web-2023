<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {FilmE, SchedaF, IDsala, Sale} from "../types" // tipo di interfaccia creata nel file types.ts
import { AsyncLocalStorage } from "async_hooks"
//import { Modifica } from "../types"

interface EditingCell{
    rowIndex: number
    field: keyof FilmE
}

export default defineComponent({
    data(){
        return {
        ListaFilm: [] as FilmE [],
        ActiveFilm: [] as FilmE[],
        ListaSale: [] as Sale[],
        //EditedFilm: [] as Film [],
        listaInfo: [] as SchedaF[],
        sala: [] as IDsala[],
        editingCell: null,
        rowIndex: null,
        editmode: false,
        idFilm: 0,
        idSala: 0,
        idOrario: 0,
        Orario_Proiezione: null,
        Data_proiezione: null,
    }
    },
    methods: {
        // Prende e visualizza nella tabella tutti i dati
        getInfo() {
            axios.get("/api/infoToUpdate").then(response => this.listaInfo = response.data)
            console.log(this.listaInfo)
        },

        getActiveFilms()
        {
            axios.get("/api/activefilms").then(response => this.ActiveFilm = response.data)
            console.log(this.ActiveFilm)
  
        },

        getSala()
        {
            axios.get("/api/listasale").then(response => this.ListaSale = response.data)
            console.log(this.ListaSale)
  
        },

        // Aggiunge una riga in fondo alla tabella 
        addProj() {
            console.log('ADD PROJ')
            console.log(this.idFilm)
            console.log(this.idSala)
            console.log(this.Data_proiezione)
            console.log(this.Orario_Proiezione)
            //test su validita' parametri
            if (this.idFilm == 0 || this.idSala == 0 || this.Data_proiezione == null || this.Orario_Proiezione == null )
            {
                alert('Dati non corretti!')
            }
            else
            {
                let idf = Number(this.idFilm)
                let ids = Number(this.idSala)
                let dp = String(this.Data_proiezione)
                let op = String(this.Orario_Proiezione)
                let idproj = ""

                const projData = {
                    idfilm: idf,
                    idsala: ids,
                    datap:  dp, 
                    orariop: op,    
                }
                console.log("Nuova P: ",projData);
                axios.post("/api/nuovaproj", projData)
                .then(response => {console.log(response.data)
                    axios.get("/api/leggiproj")
                    .then(response => {idproj = response.data[0].idproiezione,
                        console.log("Id last P: ",response.data)
                        console.log("idproj: ",idproj)
                        console.log("Sala: ",ids)
                        //copio layout sala vuota
                        axios.post("/api/aggiornaPP/"+ids)
                        .then(response => {console.log(response.data)
                            //aggiorno id proiezione 
                            axios.post("/api/aggiornaIdP/"+idproj)
                            .then(response => {console.log(response.data)})
                        })
                        
                    })
                })
                this.getInfo()
                this.$forceUpdate()
            }
        },

        // Elimina una riga dalla tabella
        deleteProj(rowIndex: any){
            axios.delete("/api/eliminaproj/"+this.listaInfo[rowIndex].idproiezione)
            .then(response => {console.log("deleting proiezione: "+this.listaInfo[rowIndex].idproiezione)})
            this.getInfo()
            this.$forceUpdate()
        },

        editCell(rowIndex: any, cellIndex: string) {
            this.editingCell = `${rowIndex}-${cellIndex}`;
        },

        updateCell(rowI: number, cellI: number, v: string|number) {
            this.ListaFilm[rowI][cellI] = v;
        },
        
        // Aggiorna i dati sul database terminando l'operazione di edit
        finishEditing(rowIndex: number) {
            let riga = this.ListaFilm[rowIndex];
            this.editingCell = null;            
            axios.put("/api/aggiornamento",riga)
            .then(response => {console.log(response.data)})
            console.log("/api/aggiornamento/"+ (rowIndex+1));
            console.log(this.ListaFilm[rowIndex]);
        },

        edit: function() {
            this.editmode = !this.editmode;
        },

        redirect(){
            this.$router.push('/adminpage')
        },

        changeFilm()
        {
            if (!this.idFilm){
                this.idFilm = 0
            }
            console.log(this.idFilm)
        },

        changeSala()
        {
            if (!this.idSala){
                this.idSala = 0
            }
            console.log(this.idSala)
        },

        changeOrario()
        {
            if (!this.Orario_Proiezione){
                this.Orario_Proiezione = null
            }
            console.log(this.Orario_Proiezione)
        },
    },
    mounted() {
    this.getInfo()
    this.getActiveFilms()
    this.getSala()
  }
})
</script>

<template>
    
    <h1>
        Secondo pannello di controllo: Gestione Proiezioni
    </h1>

    <div class="card">
        <div class="card-header">
            <h4>Dettagli films
                <button @click="addProj()" type="button" class="btn btn-primary float-end">
                    Aggiungi
                </button>
                <button id="primo-pannello-up" @click="redirect()" type="button" class="btn btn-primary float-end">
                    Vai a pannello 1
                </button>
            </h4>
        </div>
        <div>
            Nuova proiezione:
            <div class="inputBox">
                <span>Film    </span>
                <select class="firstLastNames linkBox"  v-model="idFilm" type="number" @change="changeFilm()" >
                    <option disabled >Scegli il titolo del film</option>
                    <option v-for="aFilm in ActiveFilm" :key="aFilm.idfilm" :value="aFilm.idfilm">{{aFilm.titolo}}</option>
                </select>
            </div>
            <div class="inputBox">
                <span> Sala    </span>
                <select class="firstLastNames linkBox"  v-model="idSala" type="number" @change="changeSala()" >
                    <option disabled >Scegli la sala</option>
                    <option v-for="aSala in ListaSale" :key="aSala.idsala" :value="aSala.idsala">{{aSala.descrizione}} - {{ aSala.posti }} posti - {{ aSala.tecnologia }}</option>
                </select>
            </div>
            <div class="inputBox">
                        <span>Data    </span>
                        <input 
                        v-model="Data_proiezione"
                        type="date"
                        class="rounded-lg border-slate-200"
                        />
            </div>
            <div class="inputBox">
                <span> Orario </span>
                <select class="firstLastNames linkBox"  v-model="Orario_Proiezione" type="text" @change="changeOrario()" >
                    <option disabled >Scegli l'orario</option>
                    <option> 17:00 </option>
                    <option> 21:00 </option>
                </select>
            </div>
        </div>
    
        <div class="card-body">
            <table id="tabella" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID Film</th>
                            <th>Titolo</th>
                            <th>Idproiezione</th>
                            <th>Idsala</th>
                            <th>Data Proiezione</th>
                            <th>Orario</th>
                            <th>Edita</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(film, rowIndex) in listaInfo" :key="rowIndex">
                            <td v-for="(cell, cellIndex) in film" :key="cellIndex">
                                <template v-if="editingCell === `${rowIndex}-${cellIndex}`">
                                <input
                                    v-if="editmode"
                                    id="myInput"
                                    type="text"
                                    :value="cell"
                                    @input="updateCell(rowIndex, cellIndex, $event.target.value)"
                                    @blur="finishEditing(rowIndex)"
                                />
                                </template>
                                <template v-else>
                                {{ cell }}
                                </template>
                                <!-- <td>
                                    <button @click="editCell(rowIndex, cellIndex)" v-on:click="edit()"  type="button" class="btn btn-success" style="display: block;">
                                    Edit   
                                    </button>                                    
                                </td> -->
                            </td>
                            <td>   
                                <button @click="deleteProj(rowIndex)" type="button" class="btn btn-danger">
                                    Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
            </table>
         </div>   
    </div>
</template>

<style scoped>
.card {
    margin-left: 5%;
    margin-right: 5%;
}

h1{
    margin:2%;
    padding:0;
    color: white;
}

table{
    display: block;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: auto;
    width: 100%;
}

td{
    max-width: 100px;
}

#secondo-pannello{
    display: block;
    margin: 0 auto;
    margin-top: 5%;
    width:300px;
    height: 50px;
}
</style>
