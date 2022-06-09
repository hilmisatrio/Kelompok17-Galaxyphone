<template>
  <v-app>
    <Navbar />
    <div id="app">
      <v-app id="inspire" class="mx-16 mt-10">
        <div class="row">
          <div class="col-12 mb-16">
            <h2 class="ma-5"><strong class="mr-3 blue--text">Keranjang</strong><v-icon large>mdi-cart</v-icon></h2>
            <!-- table -->
            <v-card elevation="2" rounded class="mb-16">
              <template>
                <v-simple-table>
                  <template v-slot:default>
                    <thead>
                      <tr>
                        <th class="text-left">Image</th>
                        <th class="text-left">Nama</th>
                        <th class="text-left">Harga</th>
                        <th class="text-left">Jumlah</th>
                        <th class="text-left">Total Harga</th>
                        <th class="text-left">id</th>
                        <th class="text-left">Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="n in listKeranjang" :key="n.id">
                        <td>
                          <v-img
                            :src="n.gambar_utama"
                            eager
                            max-width="150"
                            max-height="150"
                            class="white--text align-end my-3"
                          />
                        </td>
                        <td>{{ n.nama }}</td>
                        <td>Rp. {{ n.harga | formatNumber }}</td>
                        <td>{{ n.jumlah }}</td>
                        <td>Rp. {{ n.total_harga | formatNumber }}</td>
                        <td>{{ n.id}}</td>
                        <td>
                          <v-btn small color="error" dark class="my-3" @click="hapusKeranjang(n.id, n.pelanggan_id)">
                            batal
                          </v-btn>
                        </td>
                      </tr>
                    </tbody>
                  </template>
                </v-simple-table>
                <v-card class="mt-16" >
                    <div class="row">
                        
                        <div class="col-6 d-flex justify-end">
                             <p class="text-md-h4 mx-16">Sub Total:</p>
                        </div>
                        <div class="col-6 text-md-h4 d-flex justify-center">Rp. {{subTotal | formatNumber}}</div>
                    </div>
                    <div class="row d-flex justify-center">
                       <v-btn large color="success" dark :to="'/pembayaran/'+this.$route.params.no" class="my-3">
                            Check Out
                       </v-btn>
                    </div>
                   
                </v-card>
              </template>
            </v-card>
          </div>
        </div>
      </v-app>
    </div>
    <Footer />
  </v-app>
</template>
<script>
import Navbar from "../components/Navbar";
import Footer from "../components/Footer";
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios);
var numeral = require("numeral");
Vue.filter("formatNumber", function (value) {
    return numeral(value).format("0,0"); // displaying other groupings/separators is possible, look at the docs
  });

export default {
  name: "detail",

  components: {
    Navbar,
    Footer,
  },
  data() {
    return {
      slides: [
        {
          src: require("../assets/image-produk/oppo_a96.jpg"),
        },
        {
          src: require("../assets/image-produk/samsung_galaxy_m53.jpg"),
        },
        {
          src: require("../assets/icon/vivo.png"),
        },
      ],
      desserts: [
        {
          src: require("../assets/image-produk/oppo_a96.jpg"),
          nama: "Frozen Yogurt",
          harga: "Rp. 5.000.000",
          harga_real: 5000000,
          jumlah: 1,
        },
        {
          src: require("../assets/image-produk/samsung_galaxy_m53.jpg"),
          nama: "Ice cream sandwich",
          harga: "Rp. 4.800.000",
          harga_real: 4800000,
          jumlah: 2,
        },
        {
          src: require("../assets/icon/vivo.png"),
          nama: "Eclair",
          harga: "Rp. 8.000.000",
          harga_real: 8000000,
          jumlah: 3,
        },
      ],
      listKeranjang: [],
      subTotal: '',
      listTotal:[],
      totalHarga: []
    };
  },
  mounted(){
    this.getProduk();
    this.hapusIdKosong();
    this.subTotalHarga()
  },
  methods :{
    getProduk() {
      Vue.axios
      .get(
        "http://localhost/galaxyphone/api/keranjang/list.php?id=" +
          this.$route.params.no
      )
      .then((response) => {
        this.listKeranjang = response.data;
        console.log(this.listKeranjang);
      });
    },
    hapusKeranjang(id_keranjang, id_pelanggan){
      Vue.axios
      .delete(
        "http://localhost/galaxyphone/api/keranjang/delete.php?id="+id_keranjang)
      .then(() => {
        
          // this.$router.push({ path: '/keranjang/'+id_pelanggan });
          // axios
          //   .get("http://localhost:3000/keranjangs")
          //   .then((response) => this.setKeranjangs(response.data))
          //   .catch((error) => console.log(error));
      });
      location.reload();
    },
    subTotalHarga(){
      Vue.axios
      .get(
        "http://localhost/galaxyphone/api/keranjang_info/list.php?pelanggan_id="+this.$route.params.no)
      .then((response) => {
        this.totalHarga = response.data[0];
        this.subTotal =  this.totalHarga['total']
        console.log(this.totalHarga);
      });
    },
    hapusIdKosong(){
      Vue.axios
      .delete(
        "http://localhost/galaxyphone/api/keranjang_info/delete.php?pelanggan_id=0")
      .then(() => {
      });
    }
  }
};
</script>
<style></style>
