<script lang="ts">
import { defineComponent, PropType} from "vue"
import axios from "axios"
import { IDsala, posto, PostoL } from "../types"
import { postoF } from "../types"
//import { Modifica } from "../types"
//import { DatiUtente } from "../types"
import { PostoL } from "../types"
//import { IdSala } from "../types"
//import Payment from "./Pagamento.vue"

export default defineComponent({
  data() {
    return {
      salaP: [] as IDsala[],
      posti:[] as postoF[],
      seatLayout: [] as PostoL[],
      importo: 0.0,
      isPopupOpen: false,
      seatL : '',
      //datiUtente: [] as DatiUtente [],
      user: ''
    }
  },
  // computed:{
  //   selectedSeatCost() {
  //     return this.selectedSeat ? this.seatCost : 0;
  //   },
  // },
  methods: {
    getSala() {
        axios.get("/api/sala/" + this.$route.params.idproiezione)
        .then(response => {this.salaP = response.data; console.log(response.data)})
    },
    getPostiF(){
      axios.get("/api/postiF/" + this.$route.params.idproiezione)
      .then(response => {this.posti = response.data; console.log(response.data)})
    },
        /* getSala() {
        axios.get("/api/sala/" + this.$route.params.idproiezione)
        .then(response => {this.sala = response.data[0]; console.log(response.data)})
    }, */

    toggleSeat(rowIndex: number, seatIndex: number) {
      const seat = this.seatLayout[rowIndex][seatIndex];
      if (!seat.reserved) {
        seat.selected = !seat.selected;
      }
    },

    bookSeats() {
      const selectedSeats: any[] = [];
      let totalCost = 0
      
      this.seatLayout.forEach(row => {
        row.forEach(seat => {
          if (seat.selected && !seat.reserved) {
            seat.reserved = true;
            seat.selected = false; // Reset selected state after booking
            selectedSeats.push(seat.label);
            this.importo =this.importo + 8.5;
            const AggParam = {
              idproiezione: this.$route.params.idproiezione,
              label: seat.label
            };            
            axios.put("/api/aggiornaPF",AggParam) // aggiorna sul database lo stato del posto selezionato. Se selezionato, diventa occupato (=1)
            .then(response => {console.log(response.data)})
          }
        });
      });
      sessionStorage.setItem('totalCost', totalCost.toString()) // settato un Item (totalCost) da passare nella pagina Pagamento.vue per poter visualizzare l'importo finale
      console.log('Costo finale:', totalCost)
      //this.$SeatList = selectedSeats;
      //console.log(this.$SeatList);
      //alert(`Booked seats: ${selectedSeats.join(', ')}, Importo: ${this.importo}`);
      //this.$router.push('/pagamento');
    },

    chunkArray(arr: number[], chunkSize: number) {
      const chunkedArr = [];
      for (let i = 0; i < arr.length; i += chunkSize) {
        chunkedArr.push(arr.slice(i, i + chunkSize));
      }
      return chunkedArr;
    },
    
    async getPostiL() {

      const res1 = await axios.get("/api/sala/" + this.$route.params.idproiezione)
      //const res = await axios.get("/api/postiL")
      console.log("ECCO I TUOI RISULTATI:", res1.data)
      //if (res1.data && res1.data.length > 0 && res1.data[0].posti_fila) {
      const paramfila = res1.data;
      console.log("RESULTS HERE:", paramfila[0].posti_fila);

      const ppf = paramfila[0].posti_fila;

      const res = await axios.get("/api/postiF/" + this.$route.params.idproiezione);
      const dataArray: number[] = res.data;
      const subArrays: number[][] = this.chunkArray(dataArray, ppf);
      console.log(res.data);

      //const dataArray = res.data;

      // Displaying data in subarrays in the console
      //const subArrays = this.chunkArray(dataArray, ppf);
      subArrays.forEach((subArray, index) => {
        console.log(`Subarray ${index + 1}:`, subArray);
        this.seatLayout.push(subArray);
      });
    //} else {
      //console.error("Invalid data structure or empty array in response.");
    //}

      /*
      const paramfila = res1.data;
      console.log("RESULTS HERE:", paramfila[0].posti_fila);

      const ppf = paramfila[0].posti_fila;

      const res = await axios.get("/api/postiF/" + this.$route.params.idproiezione)
      //this.seatLayoutDB = res.data
      console.log(res.data)

      const dataArray = res.data;

      // Displaying data in subarrays in the console
      const subArrays = this.chunkArray(dataArray, ppf); 
      subArrays.forEach((subArray, index) => {
        console.log(`Subarray ${index + 1}:`, subArray);
        this.seatLayout.push(subArray)
      });
      */
    },
    // selectSeat(seat) {
    //   this.selectedSeat = seat;
    // },
  },
  mounted() {
    //this.getSala()
    this.getIdUtente()
    this.getPostiF()
    //this.getSala()
    this.getPostiL()
    //console.log(this.seatLayout);
    //console.log('Risultati query');
    //console.log(this.salaP[0]);
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
                    :class="{ selected: seat.selected, reserved: seat.reserved }"
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
}

.seat.reserved {
  background-color: #e74c3c;
  pointer-events: none; /* Disable click for reserved seats */
}

</style>

