<script lang="ts">
import { defineComponent } from "vue"
import axios from "axios"
import { IDsala, posto, PostoL } from "../types"
import { postoF } from "../types"

export default defineComponent({
  data() {
    return {
      salaP: [] as IDsala[],
      posti:[] as postoF[],
      seatLayout: [] as PostoL[][], // doppia [] perchè  seatLayout è un array bidimensionale in cui ogni elemento rappresenta una fila di sedili e ogni sedile è un oggetto con proprietà definite dall'interfaccia PostoL. 
      //Le doppie parentesi quadre [][] indicano le due dimensioni dell'array.
      costo: null as posto | null,
      importo: 0.0,
      isPopupOpen: false,
      seatL : '',
      user: ''
    }
  },
  methods: {
    getSala() {
        axios.get("/api/sala/" + this.$route.params.idproiezione)
        .then(response => {this.salaP = response.data; console.log(response.data)})
    },
    getPostiF(){
      axios.get("/api/postiF/" + this.$route.params.idproiezione)
      .then(response => {this.posti = response.data; console.log(response.data)})
    },
    toggleSeat(rowIndex: number, seatIndex: number) {
      const seat = this.seatLayout[rowIndex][seatIndex];
      if (!seat.occupato) {
        seat.selected = !seat.selected;
      }
    },

    bookSeats() {
      const selectedSeats: any[] = [];
      const idproj = sessionStorage.getItem("proiezione");
      this.importo=0
      this.seatLayout.forEach(row => {
        row.forEach(seat => {
          if (seat.selected && !seat.occupato) {
            seat.occupato = true;
            seat.selected = false; // Reset selected state after booking
            selectedSeats.push(seat.label);
            this.importo =this.importo + 8.5;
            const AggParam = {
              idproiezione: idproj,
              label: seat.label
            };            
            axios.put("/api/aggiornaPF",AggParam) // aggiorna sul database lo stato del posto selezionato. Se selezionato, diventa occupato (=1)
            .then(response => {console.log(response.data)})
          }
        });
      });
      const SSeats = selectedSeats.join(', ').toString()
      const totale = this.importo.toString()
      const idProiez = ''
      const usr = this.user
      sessionStorage.setItem("importo", totale);
      sessionStorage.setItem("posti", SSeats);
      sessionStorage.setItem("utente", usr); 
      this.$router.push('/pagamento');
    },

    chunkArray(arr: number[], chunkSize: number) {
      const chunkedArr = [];
      for (let i = 0; i < arr.length; i += chunkSize) {
        chunkedArr.push(arr.slice(i, i + chunkSize));
      }
      return chunkedArr;
    },
    
    async getPostiL() {
      const idproj = sessionStorage.getItem("proiezione");
      const res1 = await axios.get("/api/sala/" + idproj)
      
      console.log("ECCO I TUOI RISULTATI:", res1.data)
      
      const paramfila = res1.data;
      console.log("RESULTS HERE:", paramfila[0].posti_fila);
      console.log("ID PROIEZIONE: ", idproj)
      const ppf = paramfila[0].posti_fila;

      const res = await axios.get("/api/postiF/" + idproj);
      const dataArray: number[] = res.data;
      const subArrays: number[][] = this.chunkArray(dataArray, ppf);
      console.log(res.data);

      subArrays.forEach((subArray, index) => {
        console.log(`Subarray ${index + 1}:`, subArray);
        this.seatLayout.push(subArray);
      });

    },
    
    async getIdUtente(){
            const res = await axios.get("/api/auth/profile")
            this.user = res.data.idutente
            console.log(this.user)                    
    },
  },
  mounted() {
    this.getIdUtente()
    this.getPostiL()
    console.log(this.seatLayout);
  }
});
</script>

<template>
    <div class="seat-booking">
        <h2>Seleziona il tuo posto</h2>
        <div id="schermo"></div>
        <div class="seats">
            <div
                v-for="(row, rowIndex) in seatLayout"
                :key="rowIndex"
                class="seat-row"
            >
                <div
                    v-for="(seat, seatIndex) in row"
                    :key="seatIndex"
                    class="seat"
                    :class="{ selected: seat.selected, occupato: seat.occupato }"
                    @click="toggleSeat(rowIndex, seatIndex)"
                    >
                    {{ seat.label }}
                </div>
            </div>
        </div>
        <button @click="bookSeats">Prenota i posti selezionati</button>
        
    </div>
</template>

<style scoped>
#schermo{
  width:200px;
  height: 120px;
  border-width: 3%;
  background-color: white;
  border-color: black;
  display: block;
  margin: 0 auto;
  transform: rotateX(45deg);
  box-shadow: 0 3px 10px rgba(255,255,255,0.7);

}
.seat-booking {
  color: aliceblue;  
  text-align: center;
  margin-top: 30px;
}

.seats {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
}

.seat-row {
  display: flex;
  justify-content: center;
  margin-bottom: 10px;
}

.seat {
  margin: 5px;
  padding: 10px;
  border: 1px solid #ccc;
  cursor: pointer;
  max-width: 50px;
  text-align: center;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.seat.selected {
  background-color: #aff0ff;
  color:black;
  font-weight: bold;
}

.seat.occupato {
  color: black;
  font-weight: bold;
  pointer-events: none; /* Disable click for reserved seats */
  background: repeating-linear-gradient(
    45deg,
    #e74c3c,
    #e74c3c 10px,
    #F6EAEA 10px,
    #F6EAEA 20px
  );
}

</style>

