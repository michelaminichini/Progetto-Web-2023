<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" // tipo di interfaccia creata nel file types.ts
import { Modifica } from "../types"

interface EditingCell{
    rowIndex: number
    field: string
    //keyof Film 
}

export default defineComponent({
    data(){
        return {
        ListaFilm: [] as Film [],
        editingCell: null as EditingCell| null
    }
    },
    methods: {
        getLista() {
            axios.get("/api/tuttifilm").then(response => this.ListaFilm = response.data)
        },
        putFilm(){
            axios.put("/api/inserimento")
        },
        startEditing(rowIndex: number, field: string){
            this.editingCell = { rowIndex, field};
            console.log(this.editingCell);
        },

        stopEditing(){           
            //this.saveChanges();
            this.editingCell = null;
        },
        saveChanges(){
            axios.post("/api/inserimento",{title: "prova4"});
        /*
            axios.post("/api/update-films", this.ListaFilm).then((response) => {
                console.log("Changes saved:", response.data);
            }).catch((error) => {
                console.error("Error saving changes:", error);
            });
        */ 
        },

        isEditing(rowIndex: number, field: string){
            return this.editingCell !== null && this.editingCell.rowIndex === rowIndex && this.editingCell.field === field;
        },

       
    },
    mounted() {
    this.getLista()
  }
})


</script>

<template>
    <h1>Prova pagina admin collegata col db</h1>
    <button @click="saveChanges()" type="button" class="btn btn-primary">Prova</button>
<body>
    <div id="app">
        <div class="container">
            <h3 class="p-3 text-center">Prova</h3>
            <table class="table table-striped table-bordered" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Titolo</th>
                        <th>Regista</th>
                        <th>Genere</th>
                        <th>Durata</th>
                        <th>Nazione</th>
                        <th>Anno</th>
                        <th>Stato</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(Film, rowIndex) in ListaFilm" :key="Film.idfilm">
                        <td>{{ Film.idfilm}}</td> 
                        <td v-if="!isEditing(rowIndex, Film.titolo)" @click="startEditing(rowIndex,Film.titolo)">{{ Film.titolo }}</td>
                        <td v-if="isEditing(rowIndex, Film.titolo)">
                            <!-- <input class="input" type="text" v-model="ListaFilm[rowIndex].titolo" @blur="stopEditing" /> -->
                            <input class="input" type="text" v-model="Film.titolo"/>
                        </td>
                        
                        <td v-if="!isEditing(rowIndex, Film.regista)" @click="startEditing(rowIndex, Film.regista)">{{ Film.regista }}</td>
                        <td v-else>
                            <input type="text" v-model="Film.regista" @blur="stopEditing" />
                        </td>

                        <td v-if="!isEditing(rowIndex, Film.genere)" @click="startEditing(rowIndex, Film.genere)">{{ Film.genere }}</td>
                        <td v-else>
                        <input type="text" v-model="Film.genere" @blur="stopEditing" />
                        </td>

                        
    
                        <td>{{Film.durata}}</td>
                        <td>{{Film.nazione}}</td>
                        <td>{{Film.anno}}</td>

                        <td v-if="!isEditing(rowIndex, Film.attivo)" @click="startEditing(rowIndex, Film.attivo)">{{ Film.attivo }}</td>
                        <td v-else>
                        <input type="text" v-model="Film.attivo" @blur="stopEditing" />
                        </td>
                        
                        
                    </tr>
                </tbody>
            </table>
        </div>    
    </div>
    <!--<div id="app">
         <table class="table table-striped table-bordered" contenteditable="true">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Titolo</th>
                    <th>Regista</th>
                    <th>Genere</th>
                    <th>Durata</th>
                    <th>Nazione</th>
                    <th>Anno</th>
                    <th>Descrizione</th>
                    <th>Trailer</th>
                    <th>Locandina</th>
                    <th>Lingua</th>
                    <th>Attori</th>
                    <th>Stato</th>
                </tr>
            </thead>
            <tbody>
                <div v-for= "(film, rowIndex) in ListaFilm" :key="film.idfilm" id="prova" class="cineContainer">    
                    
                    <th>{{ film.idfilm }}</th>
                    <td v-if="!isEditing(rowIndex, film.titolo)" @click="startEditing(rowIndex, film.titolo)">{{ film.titolo }}</td>
                    <td v-else>
                        <input type="text" v-model="film.titolo" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.regista)" @click="startEditing(rowIndex, film.regista)">{{ film.regista }}</td>
                    <td v-else>
                        <input type="text" v-model="film.regista" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.genere)" @click="startEditing(rowIndex, film.genere)">{{ film.genere }}</td>
                    <td v-else>
                        <input type="text" v-model="film.genere" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.durata)" @click="startEditing(rowIndex, film.durata)">{{ film.durata }}</td>
                    <td v-else>
                        <input type="text" v-model="film.durata" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.nazione)" @click="startEditing(rowIndex, film.nazione)">{{ film.nazione }}</td>
                    <td v-else>
                        <input type="text" v-model="film.nazione" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.anno)" @click="startEditing(rowIndex, film.anno)">{{ film.anno }}</td>
                    <td v-else>
                        <input type="text" v-model="film.anno" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.descrizione)" @click="startEditing(rowIndex, film.descrizione)">{{ film.descrizione }}</td>
                    <td v-else>
                        <input type="text" v-model="film.descrizione" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.trailer)" @click="startEditing(rowIndex, film.trailer)">{{ film.trailer }}</td>
                    <td v-else>
                        <input type="text" v-model="film.trailer" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.locandina)" @click="startEditing(rowIndex, film.locandina)">{{ film.locandina }}</td>
                    <td v-else>
                        <input type="text" v-model="film.locandina" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.lingua)" @click="startEditing(rowIndex, film.lingua)">{{ film.lingua }}</td>
                    <td v-else>
                        <input type="text" v-model="film.lingua" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.attori)" @click="startEditing(rowIndex, film.attori)">{{ film.attori }}</td>
                    <td v-else>
                        <input type="text" v-model="film.attori" @blur="stopEditing" />
                    </td>
                    <td v-if="!isEditing(rowIndex, film.attivo)" @click="startEditing(rowIndex, film.attivo)">{{ film.attivo }}</td>
                    <td v-else>
                        <input type="text" v-model="film.attivo" @blur="stopEditing" />
                    </td>
                </div>
            </tbody>
        </table> 
    
    </div>-->
    <!-- <div id="app">
        <div v-for=" proiezioni in proiezioneSB" :key="proiezioni.idproiezione">
            <article >
                <p>{{proiezioni.idproiezione}} </p>
            </article>
            <RouterLink :to="'/sala/' + proiezioni.idproiezione">Prenota posti </RouterLink>
        </div>
    </div> -->


</body>
</template>

<style>
button{
    margin-left: 20%;
}
h1, h2, p{
    color:aliceblue;
    margin: 10%;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  color: aliceblue;
}

</style>

