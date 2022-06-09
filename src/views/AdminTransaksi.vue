<template>
  <v-app>
    <navbar-admin />
    <div id="app" class="ma-16">
      <v-app id="inspire">
        <v-card id="pesanan" v-if="(isHidden = condition)">
          <v-card-title>
            <v-tabs v-model="tabs" class="">
              <v-tab @click="aksiPesanan()"> Pesanan </v-tab>
              <v-tab @click="aksiDetail()"> Detail Pesanan </v-tab>
            </v-tabs>
          </v-card-title>
          <v-card-title>
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
          </v-card-title>
          <v-data-table
            :headers="headersPesanan"
            :items="listPesanan"
            :search="search"
          ></v-data-table>
        </v-card>
        <v-card id="detail" v-if="(isHidden = !condition)">
          <v-card-title>
            <v-tabs v-model="tabs" class="">
              <v-tab @click="aksiPesanan()"> Pesanan </v-tab>
              <v-tab @click="aksiDetail()"> Detail Pesanan </v-tab>
            </v-tabs>
          </v-card-title>
          <v-card-title>
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
          </v-card-title>
          <v-data-table
            :headers="headersDetailPesanan"
            :items="listDetailPesanan"
            :search="search"
          ></v-data-table>
        </v-card>
      </v-app>
    </div>
    <Footer />
  </v-app>
</template>
<script>
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
import NavbarAdmin from "@/components/NavbarAdmin.vue";
import Footer from "@/components/Footer.vue";

Vue.use(VueAxios, axios);

export default {
  name: "AdminTransaksi",

  components: { NavbarAdmin, Footer },
  data() {
    return {
      isHidden: true,
      search: "",
      headersPesanan: [
        {
          text: "id",
          align: "start",
          filterable: false,
          value: "id",
        },
        { text: "Pelanggan ID", value: "pelanggan_id" },
        { text: "Jumlah Biaya", value: "jumlah_biaya" },
        { text: "Alamat Pengiriman", value: "alamat_pengiriman" },
        { text: "Tanggal Pemesanan", value: "tanggal_pemesanan" },
        { text: "Metode Pembayaran", value: "metode_pembayaran" },
      ],
      headersDetailPesanan: [
        {
          text: "id",
          align: "start",
          filterable: false,
          value: "id",
        },
        { text: "Pesanan ID", value: "pesanan_id" },
        { text: "Produk ID", value: "produk_id" },
        { text: "Harga", value: "harga" },
        { text: "Kuantitas", value: "kuantitas" },
      ],
      listPesanan: [],
      listDetailPesanan: [],
      condition: true,
    };
  },
  mounted() {
    this.getdataPesanan();
    this.getdataDetailPesanan();
  },
  methods: {
    getdataPesanan() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/pesanan/list.php")
        .then((response) => {
          this.listPesanan = response.data;
          console.log(this.listPesanan);
        });
    },
    getdataDetailPesanan() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/detail_pesanan/list.php")
        .then((response) => {
          this.listDetailPesanan = response.data;
          console.log(this.listDetailPesanan);
        });
    },
    //show dan hidden pada table
    aksiDetail(){
        this.condition = false;
    },
    aksiPesanan(){
        this.condition = true;
    }
  },
};
</script>
