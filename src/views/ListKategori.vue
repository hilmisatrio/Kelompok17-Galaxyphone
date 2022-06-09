<template>
  <v-app>
    <navbar />
    <div id="app">
      <v-app id="inspire" class="mx-16 mt-10">
        <v-container grid-list-xs>
          <div class="row" id="app">
            <div class="col-2">
              <v-img :src="gambar" width="120" height="120" class="ma-auto"></v-img>
            </div>
            <div class="col-10 d-flex justify-end">
              <p>
                home/<strong class="blue--text text--lighten-1"
                  >kategori</strong
                >
              </p>
            </div>
          </div>
          <div class="row">
            <!-- list kategori -->
            <div class="col-2 text-center">
              <v-card class="mx-auto" max-width="500">
                <v-list width="100%">
                  <v-list-item-group v-model="model">
                    <v-list-item v-for="(item, i) in items" :key="i">
                      <v-list-item-content>
                        <v-btn
                          class="text-md-h6"
                          v-text="item.text"
                          :to="item.src"
                          @click="refresh"
                        ></v-btn>
                      </v-list-item-content>
                    </v-list-item>
                  </v-list-item-group>
                </v-list>
              </v-card>
            </div>
            <div class="col-10">
              <!-- card -->
              <v-content>
                <v-container fluid grid-list-md>
                  <v-layout row wrap>
                    <v-flex class="mx-auto" v-for="n in listProduk" :key="n.id">
                      <v-card class="ma-3 text-center" height="410" width="250">
                        <!-- batas -->
                        <row>
                          <v-img
                            class="white--text align-end"
                            width="100%"
                            :src="n.gambar_utama_produk"
                          >
                          </v-img>
                        </row>

                        <v-card-subtitle class="pb-0 font-weight-black">{{
                          n.nama_produk
                        }}</v-card-subtitle>

                        <v-card-text class="text--primary">
                          <div>Rp. {{ n.harga_produk | formatNumber }}</div>
                        </v-card-text>

                        <div class="row">
                          <div class="col-6 text-center ma-auto">
                            <p>Terjual : {{ n.hasil_penjualan_produk }}</p>
                          </div>
                          <div class="col-6 d-flex justify-md-end">
                            <v-card-actions class="d-flex justify-lg-end">
                              <v-btn color="orange" text>
                                <router-link
                                  class="text-decoration-none"
                                  :to="'/detail/' + n.produk_id+'/'+id_pelanggan"
                                  ><v-icon>mdi-eye</v-icon> Lihat</router-link
                                >
                              </v-btn>
                            </v-card-actions>
                          </div>
                        </div>
                        <v-row
                          class="fill-height"
                          align="center"
                          justify="center"
                        >
                          <v-scale-transition>
                            <v-icon
                              v-if="active"
                              color="white"
                              size="48"
                              v-text="'mdi-close-circle-outline'"
                            ></v-icon>
                          </v-scale-transition>
                        </v-row>
                        <!-- batas -->
                      </v-card>
                    </v-flex>
                  </v-layout>
                </v-container>
              </v-content>
              <!-- card -->
            </div>
          </div>
        </v-container>
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
  name: "ListKategori",

  components: {
    Navbar,
    Footer,
  },
  data() {
    return {
      items: [
        {
          text: "Samsung",
          src: "/listkategori/" + 1+'/'+ this.$route.params.no,
        },
        {
          text: "SONY",
          src: "/listkategori/" + 11+'/'+ this.$route.params.no,
        },
        {
          text: "VIVO",
          src: "/listkategori/" + 7+'/'+ this.$route.params.no,
        },
        {
          text: "Xiaomi",
          src: "/listkategori/" + 2+'/'+ this.$route.params.no,
        },
        {
          text: "OPPO",
          src: "/listkategori/" + 4+'/'+ this.$route.params.no,
        },
        {
          text: "ASUS",
          src: "/listkategori/" + 10+'/'+ this.$route.params.no,
        },
        {
          text: "Iphone",
          src: "/listkategori/" + 12+'/'+ this.$route.params.no,
        },
      ],
      listProduk: [],
      title: "",
      gambar: "",
      id_pelanggan : this.$route.params.no,
    };
  },
  mounted() {
    Vue.axios
      .get(
        "http://localhost/galaxyphone/api/kategori_produk/list.php?id=" +
          this.$route.params.id
      )
      .then((response) => {
        this.listProduk = response.data;
        console.log(this.listProduk);
      });
      this.titleKategori();
  },
  methods: {
    refresh() {
      location.reload();
    },
    titleKategori() {
      if (this.$route.params.id == 1) {
        this.title = "SAMSUNG";
        this.gambar = require('../assets/icon/samsung.png')
      } else if(this.$route.params.id == 11) {
        this.title = "SONY";
        this.gambar = require('../assets/icon/sony.png')
      }else if(this.$route.params.id == 7){
        this.title ="VIVO";
        this.gambar = require('../assets/icon/vivo.png')
      }else if(this.$route.params.id == 2){
        this.title = 'Xiaomi';
        this.gambar = require('../assets/icon/xiaomi.png')
      }else if(this.$route.params.id == 4){
        this.title = 'OPPO';
        this.gambar = require('../assets/icon/oppo.png')
      }else if(this.$route.params.id == 10){
        this.title = 'ASUS';
        this.gambar = require('../assets/icon/asus.png')
      }else{
        this.title = 'Iphone';
        this.gambar = require('../assets/icon/apple-logo.png')
      }
    },
  },
};
</script>
