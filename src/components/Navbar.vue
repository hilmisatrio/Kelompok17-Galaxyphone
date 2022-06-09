<template>
  <v-toolbar elevation="4">
    <v-toolbar-title class="ml-10 mr-10"
      ><router-link :to="'/home/'+this.$route.params.no" class="text-decoration-none"
        >Galaxyphone</router-link
      ></v-toolbar-title
    >
    <v-text-field
      v-model="search"
      class="mx-4"
      flat
      hide-details
      label="Search"
      prepend-inner-icon="mdi-magnify"
      solo-inverted
      @keyup.enter="getProduk"
    ></v-text-field>
    <div class="ml-16 mr-10">
      <v-tabs v-model="tabs" class="d-flex justify-end">
        <v-tab>
          <router-link :to="'/listkategori/1/'+ this.$route.params.no" class="text-decoration-none"
            >Kategori</router-link
          >
        </v-tab>
        <v-tab>
          <router-link :to="'/keranjang/'+this.$route.params.no" class="text-decoration-none"
            ><v-icon medium color="blue-grey darken-2">
              mdi-cart
            </v-icon></router-link
          >
        </v-tab>
        <v-tab class="text-center">
          <!-- <v-icon medium color="blue-grey darken-2"> mdi-account</v-icon> -->
          <v-menu offset-y>
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="white" dark v-bind="attrs" v-on="on">
                <v-icon medium color="blue-grey darken-2"> mdi-account</v-icon>
              </v-btn>
            </template>
            <v-list>
              <v-list-item v-for="(item, index) in menu_profil" :key="index">
                <a :href="item.src" class="text-decoration-none"
                  ><v-list-item-title>{{ item.title }}</v-list-item-title></a
                >
              </v-list-item>
            </v-list>
          </v-menu>
        </v-tab>
      </v-tabs>
    </div>
  </v-toolbar>
</template>

<script>
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios);
export default {
  name: "Navbar",
  data() {
    return {
      items: ["Samsung", "OPPO", "SONY"],
      menu_profil: [
        { title: "Login", src: "/" },
        { title: "Logout", src: "/" },
        {
          title: "Registrasi",
          src: "/registrasi",
        },
      ],
      listProfil: [],
      nama:'',
    };
  },
  mounted(){
  },
  methods :{
    
  }
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
