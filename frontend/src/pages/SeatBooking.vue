<script lang="ts">

import {defineComponent} from "vue"
import axios from "axios"
import {Film} from "../types" // tipo di interfaccia creata nel file types.ts
//import { Modifica } from "../types"
//import { IdSala } from "../types"
import { PostoL } from "../types"

export default {
  data() {
    return {
      //sala: [] as IdSala[],
      seatLayout: [] as PostoL[]
      /* seatLayout: [
        [{ label: 'A1', selected: false, reserved: false }, { label: 'A2', selected: false, reserved: false }, { label: 'A3', selected: false, reserved: false }, { label: 'A4', selected: false, reserved: false }, { label: 'A5', selected: false, reserved: false }],
        [{ label: 'B1', selected: false, reserved: false }, { label: 'B2', selected: false, reserved: false }, { label: 'B3', selected: false, reserved: false }, { label: 'B4', selected: false, reserved: false }]
        // Add more rows and seats as needed
      ], */
    }
  },
  methods: {
    /* getSala() {
        axios.get("/api/sala/" + this.$route.params.idproiezione)
        .then(response => {this.sala = response.data[0]; console.log(response.data)})
    }, */

    toggleSeat(rowIndex, seatIndex) {
      const seat = this.seatLayout[rowIndex][seatIndex];
      if (!seat.reserved) {
        seat.selected = !seat.selected;
      }
    },
    bookSeats() {
      const selectedSeats = [];
      this.seatLayout.forEach(row => {
        row.forEach(seat => {
          if (seat.selected && !seat.reserved) {
            seat.reserved = true;
            seat.selected = false; // Reset selected state after booking
            selectedSeats.push(seat.label);            
            axios.put("/api/aggiornaP",seat)
            .then(response => {console.log(response.data)})
          }
        });
      });
      alert(`Booked seats: ${selectedSeats.join(', ')}`);
      this.$router.push('/pagamento');
    },
    chunkArray(arr, chunkSize: number) {
      const chunkedArr = [];
      for (let i = 0; i < arr.length; i += chunkSize) {
        chunkedArr.push(arr.slice(i, i + chunkSize));
      }
      return chunkedArr;
    },

    async getPostiL() {
      const res = await axios.get("/api/postiL")
      //this.seatLayoutDB = res.data
      console.log(res.data)

      const dataArray = res.data;

      // Displaying data in subarrays in the console
      const subArrays = this.chunkArray(dataArray, 15); // Change '3' to your desired subarray size
      subArrays.forEach((subArray, index) => {
        console.log(`Subarray ${index + 1}:`, subArray);
        this.seatLayout.push(subArray)
      });
    },
  },
  computed: {
    
  },
  mounted() {
    //this.getSala()
    this.getPostiL()
    //console.log(this.seatLayout);
    console.log(this.seatLayout);
  }
};

</script>

<template>
    <div class="seat-booking">
        <h2>Select Your Seats</h2>
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
        <button @click="bookSeats">Book Selected Seats</button>
    </div>
</template>

<style scoped>
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
}

.seat.selected {
  background-color: #6bd1e7;
}

.seat.reserved {
  background-color: #e74c3c;
  pointer-events: none; /* Disable click for reserved seats */
}

</style>

