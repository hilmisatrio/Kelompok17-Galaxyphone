<template>
  <v-app>
    <Navbar />
    <div id="app">
      <v-app id="inspire" class="mx-16 mt-10">
        <div class="row">
          <!-- gambar produk list -->
          <div class="col-3">
            <v-card elevation="7" width="auto" height="auto" class="mx-auto">
              <v-system-bar lights-out></v-system-bar>
              <v-carousel
                :continuous="false"
                :cycle="cycle"
                :show-arrows="false"
                hide-delimiter-background
                delimiter-icon="mdi-minus"
                height="100%"
                class="my-3"
              >
                <v-carousel-item
                  v-for="(slide, i) in slides"
                  :key="i"
                  max-width="100%"
                  max-height="100%"
                >
                  <v-img
                    :src="detailProduk.gambar_utama"
                    eager
                    class="white--text align-end"
                  />
                </v-carousel-item>
              </v-carousel>
            </v-card>
          </div>
          <!-- deskripsi produk dan spesifikasi -->
          <div class="col-9">
            <v-card class="mx-auto" max-width="100%" height="auto">
              <v-card-text>
                <p class="text-h4 text--primary">{{ detailProduk.nama }}</p>
                <p class="text-h5 text--primary">Rp.{{ detailProduk.harga | formatNumber }}</p>
                <!-- DESKRIPSI SINGKAT -->
                <div class="text--primary">
                  {{ detailProduk.deskripsi }}
                </div>
              </v-card-text>
              <v-card-actions>
                <v-btn text color="teal accent-4" @click="reveal = true">
                  Lihat spesifikasi
                </v-btn>
              </v-card-actions>
              <!-- get data -->
              <!-- batas -->
              <!-- jumlah pesanan -->
              <v-col cols="12" sm="6" md="4">
                <p>stock tersedia : {{ detailProduk.stock }}</p>
                <v-text-field
                  label="jumlah"
                  placeholder="0"
                  filled
                  rounded
                  dense
                  v-model="jumlah_produk"
                ></v-text-field>
                <v-card-actions class="pt-0">
                  <v-btn text color="teal accent-4" @click="postKeranjang()"
                    ><v-icon>mdi-cart</v-icon>
                    Add to cart
                  </v-btn>
                </v-card-actions>
              </v-col>
              <v-expand-transition>
                <v-card
                  v-if="reveal"
                  class="transition-fast-in-fast-out v-card--reveal"
                  style="height: 100%"
                >
                  <v-card-text class="pb-0">
                    <p class="text-h4 text--primary">
                      {{ detailProduk.nama }}
                    </p>
                    <p class="text-h5 text--primary">
                      Rp. {{ detailProduk.harga | formatNumber }}
                    </p>
                    <br>
                    <div class="row mr-16 ml-5">
                      {{ detailProduk.spesifikasi }}
                    </div>
                  </v-card-text>
                  <br>
                  <v-card-actions class="pt-0 mt-15">
                    <v-btn text color="teal accent-4" @click="reveal = false">
                      Close
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-expand-transition>
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

// format uang rupiah
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
      reveal: false,
      detailProduk: [],
      jumlah_produk: "",
      produk_id: this.$route.params.id,
      nama_produk: "",
      harga_produk: "",
      gambar_utama: "",
      pelanggan_id: "1",
    };
  },
  mounted() {
    this.getProduk();
  },
  methods: {
    getProduk() {
      Vue.axios
        .get(
          "http://localhost/galaxyphone/api/produk/detail.php?id=" +
            this.$route.params.id
        )
        .then((response) => {
          this.detailProduk = response.data;
          this.nama_produk = this.detailProduk["nama"];
          this.harga_produk = this.detailProduk["harga"];
          this.gambar_utama = this.detailProduk["gambar_utama"];
          console.log(this.detailProduk);
        });
    },
    postKeranjang() {
      if(this.jumlah_produk === ''){
        this.jumlah_produk = 1;
      }
      Vue.axios
        .post("http://localhost/galaxyphone/api/keranjang/create.php", {
          pelanggan_id: this.$route.params.no,
          produk_id: this.produk_id,
          nama: this.nama_produk,
          harga: this.harga_produk,
          jumlah: this.jumlah_produk,
          total_harga: this.harga_produk * this.jumlah_produk,
          gambar_utama : this.gambar_utama,
        })
        .then(() => {
            this.$router.push({ path: '/keranjang/'+this.$route.params.no });
        });
    },
  },
};
</script>
<style>
.v-card--reveal {
  bottom: 0;
  opacity: 1 !important;
  position: absolute;
  width: 100%;
}
</style>
