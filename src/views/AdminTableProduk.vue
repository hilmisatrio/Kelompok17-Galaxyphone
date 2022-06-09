<template>
  <v-app>
    <NavbarAdmin />
    <div id="app" class="ma-16">
      <div class="row ma-10">
        <v-row>
          <v-row>
            <v-action>
              <v-btn depressed color="primary" :to="'/admintambahproduk/'+this.$route.params.no">
                Tambah Data <v-icon>mdi-plus</v-icon>
              </v-btn>
            </v-action>
          </v-row>
          <!-- untuk memiliki update atau hapus -->
          <v-row>
            <v-form class="ma-10">
              <v-text-field
                v-model="id"
                label="id produk"
                placeholder="Cth. 1"
                @keyup="getId(id)"
              >
              </v-text-field>
            </v-form>
            <v-action class="ma-10">
              <v-btn depressed color="primary" @click="hapusProduk(id)">
                HAPUS <v-icon>mdi-plus</v-icon>
              </v-btn>
            </v-action>
            <v-action class="ma-10">
              <!-- <v-btn
                depressed
                color="primary"
                :to="'/adminupdateproduk/' + id_produk +'/'+this.$route.params.no"
              >
                UPDATE <v-icon>mdi-plus</v-icon>
              </v-btn> -->
              <v-btn
                depressed
                color="primary"
                @click="updateProduk(id)"
              >
                UPDATE <v-icon>mdi-plus</v-icon>
              </v-btn>
            </v-action>
          </v-row>
        </v-row>
      </div>
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
            :items="listProduk"
            :search="search"
          ></v-data-table>
        </v-card>
      </v-app>
      <Footer/>
    </div>
  </v-app>
</template>
<script>
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
import NavbarAdmin from "../components/NavbarAdmin.vue";
import Footer from '@/components/Footer.vue';
Vue.use(VueAxios, axios);

export default {
  name: "AdminTabelProduk",

  components: {
    NavbarAdmin,
    Footer,
  },
  data() {
    return {
      search: "",
      headers: [
        {
          text: "id",
          align: "start",
          filterable: false,
          value: "id",
        },
        { text: "nama", value: "nama" },
        { text: "harga", value: "harga" },
        { text: "berat", value: "berat" },
        { text: "deskripsi", value: "deskripsi" },
        { text: "stock", value: "stock" },
      ],
      listProduk: [],
      cari: {
        id: "",
      },
      id_produk: "",
    };
  },
  mounted() {
    this.getdata();
    this.hapusDataKosong();
  },
  methods: {
    getdata() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/produk/list.php")
        .then((response) => {
          this.listProduk = response.data;
          console.log(this.listProduk);
        });
    },
    hapusProduk(id_produk) {
      if(this.id_produk){
      Vue.axios
        .delete(
          "http://localhost/galaxyphone/api/produk/delete.php?id=" + id_produk
        )
        .then(() => {
          alert('produk berhasil dihapus')
          location.reload();
        });
      }else{
        alert('masukan id produk yang akan anda hapus!')
      }
    },
    updateProduk(id_produk){
      if(this.id_produk){
        return this.$router.push({ path: '/adminupdateproduk/' + id_produk +'/'+this.$route.params.no});
      }else{
         alert('masukan id produk yang akan anda update!')
      }
      
    },
    getId(id) {
      this.id_produk = id;
    },
    hapusDataKosong(){
       Vue.axios
        .delete('http://localhost/galaxyphone/api/produk_table/delete.php?harga=0')
        .then(() => {
        });
    },
  },
};
</script>
