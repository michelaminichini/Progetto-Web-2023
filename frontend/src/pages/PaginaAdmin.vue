<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" 


export default defineComponent({
    data(){
        return {
            films: [] as Film[],
            filmDetails:{
                idfilm: 0,
                titolo: '',
                regista: '',
                genere: '',
                durata: 0,
                nazione: '',
                anno: '',
                descrizione: '',
                locandina: '',
                lingua: '',
                attori: ''
            } as {[ key: string] : any}
        }
    },
    methods: {
        getFilminLista(){
            axios.get("/api/films").then(response => this.films = response.data)
        },

        toggleEdit<T extends keyof Film>(filmId: number, attribute: T){
            const film = this.films.find((f: Film)=> f.idfilm === filmId);
            if (film){
                
                film.editing[attribute] = true;
                this.filmDetails[attribute as string] = film[attribute] as any;
            }
            
        },
        saveChanges<T extends keyof Film>(filmId: number, attribute: T){
            const film = this.films.find((f: Film)=> f.idfilm === filmId);
            if (film){
                film[attribute]=this.filmDetails[attribute as string] as any;
                film.editing[attribute] = false;
            }
            
        },
        getProperty(obj: Record<string, any>, key: string): any{
            return obj[key];
        }


    },
    
    mounted(){
        this.getFilminLista()
   }

})


</script>

<template>
    <body>
        <div id="app">
            <div>
                <article v-for= "film in films" :key="film.idfilm" class="cineContainer">
                    <img style="height: 400px; width: 300px;" :src="'/img/' + film.locandina" alt=""/>
                    <table contenteditable="true">
                        <tbody>
                            <tr v-for="field in Object.keys(film)" :key="field">
                                <td>{{ field }}</td>
                                <td v-if="film && !film.editing[field]">{{ getProperty(film, field) }}</td>
                                <td v-else>
                                    <input v-if="field === 'length'" type="number" v-model="filmDetails[field]" />
                                    <input v-else type="text" v-model="filmDetails[field]" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                        <!--</tbody>
                        <tr>
                            <th>Titolo</th>
                            <td>{{ film.anno }}</td>
                        </tr>
                       <tr>
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
                    <button @click="toggleEdit(film.idfilm,field as keyof Film)" v-for="field in Object.keys(film)" :key="field">Edit {{ field }}</button>
                    <button @click="saveChanges(film.idfilm,field as keyof Film)" v-for="field in Object.keys(film)" :key="field">Save {{ field }}</button>"
                </article>
               <!-- <RouterLink :to="'/film/' + film.idfilm">Scheda Film</RouterLink>-->

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