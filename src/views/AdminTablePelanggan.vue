<template>
  <v-app>
    <navbar-admin/>
    <div id="app" class="ma-16">
      <v-app id="inspire">
        <v-card>
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
            :headers="headers"
            :items="listPelanggan"
            :search="search"
          ></v-data-table>
        </v-card>
      </v-app>
    </div>
    <Footer/>
  </v-app>
</template>
<script>
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
import NavbarAdmin from '@/components/NavbarAdmin.vue';
import Footer from '@/components/Footer.vue';
Vue.use(VueAxios, axios);

export default {
  name: "AdminTabelPelanggan",

  components: {NavbarAdmin, Footer},
  data() {
    return {
    search: '',
      headers: [
        {
          text: "id",
          align: "start",
          filterable: false,
          value: "id",
        },
        { text: "email", value: 'email' },
        { text: "password", value: 'password' },
        { text: "nama lengkap", value: 'nama_lengkap' },
        { text: "alamat pengiriman", value: 'alamat_pengiriman' },
        { text: "no handphone", value: 'no_hp' },
      ],
      listPelanggan: [],
    };
  },
  mounted() {
    this.getdata();
  },
  methods: {
    getdata() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/pelanggan/list.php")
        .then((response) => {
          this.listPelanggan = response.data;
          console.log(this.listPelanggan);
        });
    },
  },
};
</script>
