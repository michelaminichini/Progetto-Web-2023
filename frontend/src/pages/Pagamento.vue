<script lang="ts">
import { defineComponent } from 'vue';
import axios from "axios"

export default defineComponent({
    data(){
        return{

        }
    },
    methods:{
        
    },
    
})

</script>



<template>
    <h1>Pagamento</h1>

<body>
    <div class="container">
        <form action="">
            <div class="row">
                <div class="col">
                    <h3 class="title">billing address</h3>
                    <div class="inputBox">
                        <span>full name</span>
                        <input type="text" placeholder="john deo">
                    </div>
                    <div class="inputBox">
                        <span>email </span>
                        <input type="email" placeholder="example@example.com">
                    </div>
                    <div class="inputBox">
                        <span>address </span>
                        <input type="text" placeholder="via - n.civico">
                    </div>
                    <div class="inputBox">
                        <span>città </span>
                        <input type="text" placeholder="città">
                    </div>
                    <div class="flex">
                        <div class="inputBox">
                            <span>stato </span>
                            <input type="text" placeholder="italia">
                        </div>
                        <div class="inputBox">
                            <span>codice postale</span>
                            <input type="text" placeholder="11111">
                        </div>
                    </div>
                </div>

                <div class="col">
                    
                    <h3 class="title">payment</h3>

                    <div class="inputBox">
                        <span>name on card</span>
                        <input type="text" placeholder="john deo">
                    </div>
                    <div class="inputBox">
                        <span>credit card number</span>
                        <input type="number" placeholder="1111-2222-3333-4444">
                    </div>
                    <div class="inputBox">
                        <span>exp month </span>
                        <input type="text" placeholder="january">
                    </div>
                
                    <div class="flex">
                        <div class="inputBox">
                            <span>exp year </span>
                            <input type="number" placeholder="2023">
                        </div>
                        <div class="inputBox">
                            <span>CVV</span>
                            <input type="text" placeholder="123">
                        </div>
                    </div>
                </div>
            </div>
            <button style="background-color: blue; color: white; display: inline;" @click="">Procedi all'acquisto</button>

        </form>
    </div>

</body>


</template>

<style scoped>
body{
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    margin:0;
    padding:0;
    outline: none;
    border:none;
    text-transform:capitalize;
    transition: all .2s linear;
}

h3{
    color: #fff;
    padding-bottom: 5%;
}

h1{
    color: #fff;
    margin-left: 5%;
    padding-bottom: 2%;
}

div > span{
    color: white;
    margin:2%;
    padding-right: 2%;
}

form > input{
    width:20%;
    margin-left: 52%;
    padding:12px;
    font-size: 17px;
    background: #fff;
    color: black;
    margin-top: 5px;
    cursor: pointer;
}


</style>