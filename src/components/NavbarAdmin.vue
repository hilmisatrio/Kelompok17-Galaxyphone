<template>
  <v-toolbar elevation="4">
    <v-toolbar-title class="ml-10 mr-10"><router-link :to="'/adminproduk/'+this.$route.params.no" class="text-decoration-none">Galaxyphone Admin</router-link></v-toolbar-title>
    <div class="row d-flex justify-end ml-16 mr-10">
      <v-tabs v-model="tabs" class="">
        <v-tab>
            <router-link :to="'/adminproduk/'+this.$route.params.no" class="text-decoration-none">Produk</router-link>
        </v-tab>
        <v-tab>
          <router-link :to="'/adminpelanggan/'+this.$route.params.no" class="text-decoration-none">Pelanggan</router-link>
        </v-tab>
        <v-tab>
            <router-link :to="'/admintransaksi/'+this.$route.params.no" class="text-decoration-none">Transaksi</router-link>
        </v-tab>
        <v-row class="d-flex justify-end">
        <v-tab> 
          <router-link to="/" class="text-decoration-none">logout</router-link>
          </v-tab>
        </v-row>  
      </v-tabs>
    </div>
  </v-toolbar>
</template>

<script>
export default {
  name: "NavbarAdmin",
  data(){
    return{
        items: [
          'Samsung', 'OPPO', 'SONY'
        ],
    };
  },
};
</script>

<style>
.v-toolbar__title {
  font-size: 1rem !important;
}
.v-badge__badge {
  font-size: 10px !important;
  height: 18px !important;
  min-width: 18px !important;
}
</style>
