<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Modifica} from "../types" //qui Film si riferisce al tipo di interfaccia creata nel file types.ts

interface EditingCell{
    rowIndex: number;
    field: keyof Modifica;
}

export default defineComponent({
    data(){
        return {
        filmDaModificare: [] as Modifica[],
        editingCell: null as EditingCell| null,
        }
    },
    methods: {
        getFilminLista(){
            axios.get("/api/films").then(response => this.filmDaModificare = response.data)
        },

        startEditing(rowIndex: number, field: keyof Modifica){
            this.editingCell = { rowIndex, field};
        },

        stopEditing(){
            this.editingCell = null;
            //this.saveChanges();
        },
        /*
        saveChanges(){
            axios.post("/api/update-films", this.datiFilm).then((response) => {
        console.log("Changes saved:", response.data);
      }).catch((error) => {
        console.error("Error saving changes:", error);
      }); 
        },*/

        isEditing(rowIndex: number, field: string){
            return this.editingCell !== null && this.editingCell.rowIndex === rowIndex && this.editingCell.field === field;
        },

    },
    
    mounted(){
        this.getFilminLista()
   }

})


</script>

<template>
    <body>
        <div id="app">
            <div v-for= "(film, rowIndex) in filmDaModificare" :key="film.idfilm" id="contenitore" class="cineContainer">
                <article>
                    <!--<h2>{{ film.titolo }}</h2>-->
                    <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                    <table contenteditable="true">
                        

                        <tr v-for="field in ['titolo', 'regista', 'anno', 'lingua']" :key="field">
                            <th>{{ field }}</th>
                            <td v-if="!isEditing(rowIndex, field)" @click="startEditing(rowIndex, field)">{{ film[field] }}</td>
                            <td v-else>
                                <input type="text" v-model="filmDaModificare[rowIndex][field]" @blur="stopEditing" />
                            </td>
                        </tr>


                    
                       <!-- <tr>
                            <th>Anno uscita</th>
                            <td>{{ film.anno }}</td>
                        </tr>
                        <tr>
                            <th>Genere</th>
                            <td>{{ film.genere }}</td>
                        </tr>
                        <tr>
                            <th>Durata</th>
                            <td>{{ film.durata }} min</td>
                        </tr>
                        <tr>
                            <th>Lingua</th>
                            <td>{{ film.lingua }}</td> 
                        </tr> -->
                    </table> 
                </article>
                <RouterLink :to="'/film/' + film.idfilm">Scheda Film</RouterLink>

            </div>
        </div>
    </body>
</template>

<style scoped>

body > div > div > article > h2{
    padding:2%;
    margin:0;
}

article {
    color:aliceblue;
}

#app{
    margin-left: 10%;
}

table {
    display: inline;
    margin-left: 10%;
    width: 100%;
    margin-top: 0px;
}

td {
    width:300px;
    border: 2px solid white;
    padding: 2px;
    text-align: center;
}

th {
    background-color: transparent;
}
</style>