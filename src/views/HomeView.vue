<template>
  <v-app>
    <!-- navbar -->
    <Navbar />
    <!-- caraousel -->
    <div id="app">
      <v-app id="inspire">
        <v-carousel
          cycle
          height="600"
          hide-delimiter-background
          show-arrows-on-hover
        >
          <v-carousel-item v-for="(item, i) in items" :key="i">
            <v-img :src="item.src" height="100%" eager />
          </v-carousel-item>
        </v-carousel>
        <!-- card -->
        <div class="mx-16 mt-md-5">
          <h1>Brands</h1>
        </div>
        <div class="ma-10">
          <v-sheet class="mx-auto" max-width="100%">
            <v-slide-group multiple show-arrows>
              <v-slide-item v-for="(brand, i) in brands" :key="i">
                <router-link :to="brand.src_route">
                  <v-img
                    :src="brand.src"
                    height="100%"
                    class="mx-8"
                    depressed
                    max-width="150px"
                    max-height="100%"
                    rounded
                    eager
                  />
                </router-link>
              </v-slide-item>
            </v-slide-group>
          </v-sheet>
        </div>
      </v-app>
    </div>
    <!-- brand -->
    <!-- produk populer -->
    <div class="mx-16">
      <h1 class="mb-1">
        Products |<strong class="blue--text text--lighten-1"> Populer</strong>
      </h1>
      <!-- carousel slider -->
      <v-sheet class="mx-auto" elevation="5" max-width="100%">
        <v-slide-group
          v-model="model"
          class="pa-4"
          active-class="success"
          show-arrows
        >
          <v-slide-item v-for="n in listPopulerProduk" :key="n.id">
            <v-card class="ma-3 text-center" height="410" width="250">
              <!-- batas -->
              <row>
                <v-img
                  class="white--text align-end"
                  width="100%"
                  :src="n.gambar_utama"
                >
                </v-img>
              </row>
              <v-card-subtitle class="pb-0 font-weight-black">{{
                n.nama
              }}</v-card-subtitle>

              <v-card-text class="text--primary">
                <div>Rp. {{ n.harga | formatNumber}}</div>
              </v-card-text>
              <div class="row">
                <div class="col-6 text-center ma-auto">
                  <p>Terjual : {{ n.hasil_penjualan }}</p>
                </div>
                <div class="col-6 d-flex justify-md-end">
                  <v-card-actions class="d-flex justify-lg-end">
                    <v-btn color="orange" text>
                      <router-link
                        class="text-decoration-none"
                        :to="'/detail/' + n.id +'/'+id_pelanggan"
                        ><v-icon>mdi-eye</v-icon> Lihat</router-link
                      >
                    </v-btn>
                  </v-card-actions>
                </div>
              </div>

              <v-row class="fill-height" align="center" justify="center">
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
          </v-slide-item>
        </v-slide-group>
      </v-sheet>
    </div>

    <!-- produk new -->
    <!-- produk populer -->
    <div class="my-16 mx-16">
      <h1 class="mb-1">
        Products |<strong class="blue--text text--lighten-1"> New</strong>
      </h1>
      <!-- carousel slider -->
      <v-sheet class="mx-auto" elevation="5" max-width="100%">
        <v-slide-group
          v-model="model"
          class="pa-4"
          active-class="success"
          show-arrows
        >
          <v-slide-item v-for="n in listNewProduk" :key="n">
            <v-card class="ma-3 text-center" height="410" width="250">
              <!-- batas -->
              <row>
                <v-img
                  class="white--text align-end"
                  width="100%"
                  :src="n.gambar_utama"
                >
                </v-img>
              </row>

              <v-card-subtitle class="pb-0 font-weight-black">{{
                n.nama
              }}</v-card-subtitle>

              <v-card-text class="text--primary">
                <div>Rp. {{ n.harga | formatNumber }}</div>
              </v-card-text>

              <div class="row">
                <div class="col-6 text-center ma-auto">
                  <p>Terjual : {{ n.hasil_penjualan }}</p>
                </div>
                <div class="col-6 d-flex justify-md-end">
                  <v-card-actions class="d-flex justify-lg-end">
                    <v-btn color="orange" text>
                      <router-link
                        class="text-decoration-none"
                        :to="'/detail/' + n.id+'/'+id_pelanggan"
                        ><v-icon>mdi-eye</v-icon> Lihat</router-link
                      >
                    </v-btn>
                  </v-card-actions>
                </div>
              </div>
              <v-row class="fill-height" align="center" justify="center">
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
          </v-slide-item>
        </v-slide-group>
      </v-sheet>
    </div>
    <!-- produk new -->
    <br />
    <br />
    <Footer />
  </v-app>
</template>

<script>
// import HelloWorld from '../components/HelloWorld'
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
  name: "Home",

  components: {
    Navbar,
    Footer,
  },
  data() {
    return {
      headersProduk: [
        { text: "Nama", value: "nama" },
        { text: "Harga", value: "harga" },
        { text: "Berat", value: "berat" },
        { text: "Deskripsi", value: "deskripsi" },
        { text: "Spesifikasi", value: "spesifikasi" },
        { text: "Stock", value: "stock" },
      ],
      id_pelanggan : this.$route.params.no,
      items: [
        {
          src: require("../assets/images/Slider_Banner_Asus_Zenfone_8.jpg"),
        },
        {
          src: require("../assets/images/Slider_Banner_Samsung_Galaxy_S22.jpg"),
        },
      ],
      brands: [
        {
          src: require("../assets/icon/oppo.png"),
          src_route: "/listkategori/4/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/samsung.png"),
          src_route: "/listkategori/1/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/apple-logo.png"),
          src_route: "/listkategori/12/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/vivo.png"),
          src_route: "/listkategori/7/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/huawei.png"),
          src_route: "/listkategori/1/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/lenovo.png"),
          src_route: "/listkategori/1/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/sony.png"),
          src_route: "/listkategori/11/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/xiaomi.png"),
          src_route: "/listkategori/2/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/asus.png"),
          src_route: "/listkategori/10/"+this.$route.params.no,
        },
        {
          src: require("../assets/icon/nokia.png"),
          src_route: "/listkategori/1/"+this.$route.params.no,
        },
      ],
      deskripsi_produk: [
        {
          src: require("../assets/icon/oppo.png"),
        },
      ],
      deskripsi_produk: [
        {
          src: require("../assets/icon/oppo.png"),
        },
      ],
      listProduk: [],
      listNewProduk: [],
      listPopulerProduk: [],
      search: "",
      path: "http://localhost:8080/",
    };
  },
  mounted() {
    this.getProduk();
    this.getNewProduk();
    this.getPopulerProduk();
  },
  methods: {
    getProduk() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/produk/list.php")
        .then((response) => {
          this.listProduk = response.data;
          console.log(this.listProduk);
        });
    },
    getPopulerProduk() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/produk/list_populer_produk.php")
        .then((response) => {
          this.listPopulerProduk = response.data;
          console.log(this.listPopulerProduk);
        });
    },
    getNewProduk() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/produk/list_new_produk.php")
        .then((response) => {
          this.listNewProduk = response.data;
          console.log(this.listNewProduk);
        });
    },
    searchProduk() {
      Vue.axios
        .get(
          "http://localhost/galaxyphone/api/produk/detail.php?id=" + this.search
        )
        .then((response) => {
          this.listProduk = response.data;
          console.log(this.listProduk);
        });
    },
  },
};
</script>
