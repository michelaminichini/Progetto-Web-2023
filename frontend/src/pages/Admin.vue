<script lang="ts">
  import { defineComponent } from 'vue'
  import axios from 'axios'
  import { Film_admin, FilmResponse } from '../types';
  
  export default defineComponent({
    data() {
      return {
        newFilm: {
          titolo: '',
          genere: '',
          regista: '',
          anno: 0,
        } as Film_admin,
        films: [] as Film_admin[],
      };
    },
    methods: {
      async addFilm() {
        // Validate input (add more validation as needed)
        if (!this.newFilm.titolo || !this.newFilm.genere || !this.newFilm.regista || !this.newFilm.anno) {
          alert('Please fill in all fields.');
          return;
        }
  
        // Assume there's an API endpoint to add a new film
        // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint
        const response = await axios.post('/api/films', this.newFilm);
  
        if (response.status === 201) {
          // Update the films array with the new film
          this.films.push(this.newFilm);
  
          // Clear the form fields
          this.clearForm();
        } else {
          alert('Failed to add film. Please try again.');
        }
        // FormData to handle file uploads
        //const formData = new FormData();
        //formData.append('title', this.newFilm.titolo);
        //formData.append('genre', this.newFilm.genere);
        //formData.append('director', this.newFilm.regista);
        //formData.append('year', String(this.newFilm.anno));
        //formData.append('poster', this.newFilm.locandina); // append the poster file

        // Assume there's an API endpoint to add a new film with a poster
        // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint
        //const response = await axios.post('YOUR_API_ENDPOINT', formData);

        //if (response.status === 201) {
        // ... (existing code)
        //} else {
          //alert('Failed to add film. Please try again.');
        //}
      },
      deleteFilm(index: number) {
        // Assume there's an API endpoint to delete a film
        // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint
        axios.delete(`/api/films/${index}`).then((response) => {
          if (response.status === 204) {
            // Remove the film from the films array
            this.films.splice(index, 1);
          } else {
            alert('Failed to delete film. Please try again.');
          }
        });
      },
      clearForm() {
        this.newFilm= {
          titolo: '',
          genere: '',
          regista: '',
          anno: 0,
        };
      }
    },
    async mounted() {
      // Assume there's an API endpoint to get the list of films
      // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint
      const response = await axios.get<FilmResponse>('/api/films');
  
      // Update the films array with the retrieved films
      this.films = response.data.data;
    },
  });
  
  
</script>

 

<template>
  <div>
    <h2>Admin Page - CinemaWebApp</h2>

    
      <!--label for="locandinaFilm">Locandina</label>
      <input type="file" id="locandina" name="locandina" accept="image/*" @change="handleFileChange" required>-->
    <form @submit.prevent="addFilm">
      <label for="filmTitle">Film Title:</label>
      <input v-model="newFilm.titolo" type="text" id="filmTitle" name="filmTitle" required>

      <label for="filmGenre">Genre:</label>
      <input v-model="newFilm.genere" type="text" id="filmGenre" name="filmGenre" required>

      <label for="filmDirector">Director:</label>
      <input v-model="newFilm.regista" type="text" id="filmDirector" name="filmDirector" required>

      <label for="filmYear">Year:</label>
      <input v-model="newFilm.anno" type="number" id="filmYear" name="filmYear" required>

      <button type="submit">Add Film</button>
      <button type="button" @click="clearForm">Cancel</button>
    </form>

    <table>
      <thead>
        <tr>
          <!--th>Locandina</th>-->
          <th>Titolo</th>
          <th>Genere</th>
          <th>Regista</th>
          <th>Anno</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(film, index) in films" :key="index">
          <!--td>{{ film.locandina }}</td>-->
          <td>{{ film.titolo }}</td>
          <td>{{ film.genere }}</td>
          <td>{{ film.regista }}</td>
          <td>{{ film.anno }}</td>
          <td>
            <button @click="deleteFilm(index)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>



<style scoped>
/* Add your component-specific styles here */
body {
  font-family: Arial, sans-serif;
  margin: 20px;
  background-color: #f4f4f4;
}
h2 {
  text-align: center;
  color: #333;
}
form {
  max-width: 600px;
  margin: auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
label {
  display: block;
  margin-bottom: 8px;
}
input {
  width: 100%;
  padding: 10px;
  margin-bottom: 16px;
  box-sizing: border-box;
}
button {
  background-color: #4caf50;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 8px;
}
button.cancel {
  background-color: #e74c3c;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
th,
td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: left;
}
th {
  background-color: #f2f2f2;
}
</style>

