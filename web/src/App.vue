<template>
  <div>
    {{ pixelWall }}
  </div>
</template>

<script>
const Web3 = require('web3');

var contractABI = require('./contract_abi.json')
var infuraID = require('./infura_id.json')[0]["infuraID"]
var contractAddress = '0x5398962b61f482401E97e41a017DF9a5Cd48F247'

export default {
  name: 'App',
  components: {
  },

  data() {
    return {
      pixelWall: null,
    }
  },

  mounted() {
    let web3 = new Web3(new Web3.providers.WebsocketProvider(`wss://goerli.infura.io/ws/v3/${infuraID}`));
    const grftWall = new web3.eth.Contract(contractABI, contractAddress);
    console.log(grftWall)
    grftWall.methods.show().call().then((result) => {
      console.log(result)
      this.pixelWall = result
    })

  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
