<template>
  <v-app>
      <v-toolbar elevation="4">
    <v-toolbar-title class="ml-10 mr-10"> Galaxyphone </v-toolbar-title>
    <v-text-field
      v-model= "search"
      class="mx-4"
      flat
      hide-details
      label="Search"
      prepend-inner-icon="mdi-magnify"
      solo-inverted
      @keyup="getProduk"
    ></v-text-field>
    <div class="ml-16 mr-10">
      <v-tabs v-model="tabs" class="d-flex justify-end">
        <v-tab :items="items">Kategori</v-tab>
        <v-tab>
          <v-icon medium color="blue-grey darken-2"> mdi-cart </v-icon>
        </v-tab>
        <v-tab>
           <v-icon medium color="blue-grey darken-2"> mdi-account</v-icon>
        </v-tab>
      </v-tabs>
    </div>
  </v-toolbar>
    <div id="app">
      <v-app id="inspire" class="mx-16 mt-10">
        <div class="row" id="app">
          <div class="col-4">
            <h1><strong class="blue--text text--lighten-1">SAMSUNG</strong></h1>
          </div>
          <div class="col-8 d-flex justify-end">
            <p>
              home/<strong class="blue--text text--lighten-1">kategori</strong>
            </p>
          </div>
        </div>
        <v-container grid-list-xs>
          <div class="row">
            <!-- list kategori -->
            <div class="col-2 text-center">
              <v-card class="mx-auto" max-width="500">
                <v-list width="100%">
                  <v-list-item-group v-model="model">
                    <v-list-item v-for="(item, i) in items" :key="i">
                      <v-list-item-content>
                        <v-list-item-title class="text-md-h6"
                          v-text="item.text"
                        ></v-list-item-title>
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
                    <v-flex v-for="n in listProduk" :key="n.id">
                      <v-card class="ma-3 text-center" height="420" width="250">
                        <v-img
                          class="white--text align-end"
                          width="100%"
                          src="../assets/image-produk/samsung_galaxy_m53.jpg"
                        >
                        </v-img>
                        <v-card-subtitle class="pb-0"
                          >{{n.nama}}</v-card-subtitle
                        >
                        <v-card-text class="text--primary">
                          <div>Rp. {{n.harga}}</div>
                        </v-card-text>

                        <v-card-actions class="d-flex justify-lg-end">
                          <v-btn color="orange" text> <router-link class="text-decoration-none" :to="'/detail/'+n.id"><v-icon>mdi-eye</v-icon> Lihat</router-link> </v-btn>
                        </v-card-actions>
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
import Vue from 'vue'
 import axios from 'axios'
 import VueAxios from 'vue-axios'
 Vue.use(VueAxios, axios)
export default {
  name: "List",

  components: {
    Navbar,
    Footer,
  },
  data() {
    return {
     items: [
      {
        text: 'SONY',
      },
      {
        text: 'VIVO',
      },
      {
        text: 'Xiaomi',
      },
      {
        text: 'OPPO',
      },
      {
        text: 'Iphone',
      },
    ],
    listProduk: [],
    search: '',
    };
  },
  mounted(){
       Vue.axios.get('http://localhost/galaxyphone/api/produk/list.php')
      .then((response) =>{
        this.listProduk = response.data
        console.log(this.listProduk)
      }
      )
  },
  methods: {
    getProduk(){
      Vue.axios.get('http://localhost/galaxyphone/api/produk/detail.php?id='+this.search)
      .then((response) =>{
        this.listProduk = response.data
        console.log(this.listProduk)
      }
      )
    },
  },
};
</script>
