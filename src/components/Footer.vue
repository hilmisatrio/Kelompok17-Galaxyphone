<template>
  <v-app class="mt-n16">
    <div class="row my-5 mx-16">
        <div class="col-6 align-center">
              <v-img
               class="white--text align-end"
                    width="60%"
                    src="../assets/icon/title-toko.png"
              >
              </v-img>
        </div>
        <div class="col-6 ma-auto">
            <h4>Galaxphone menyediakan berbagai jenis ponsel dari beberapa merk ternama di dunia. Toko ini menjun
              njung tinggi kenyamanan dan kepercayaan pelanggan. Barang yang sudah dibeli dapat ditukar dengan syarat
              barang tersebut dalam keadaan baik.
            </h4>
            <br>
            <!-- identitas toko -->
            <h4 class="mt-3">
              <strong class="blue--text text--lighten-1">Alamat Toko </strong>
              <v-icon medium color="blue-grey darken-2"> mdi-map-marker </v-icon>
            </h4>
            <h4>Mall Jayakarta Lantai 2 Blok AC</h4>
            <h4 class="mt-3"><strong class="blue--text text--lighten-1">No.Telp </strong>
            <v-icon medium color="blue-grey darken-2"> mdi-phone </v-icon>
            </h4>
            <h4>082392323723</h4>
            <h4 class="mt-3"><strong class="blue--text text--lighten-1">Email </strong>
            <v-icon medium color="blue-grey darken-2"> mdi-email </v-icon>
            </h4>
            <h4>galaxphone@gmail.com</h4>
            <h4 class="mt-3"><strong class="blue--text text--lighten-1">Website </strong> 
              <v-icon medium color="blue-grey darken-2"> mdi-web </v-icon></h4>
            <h4>www.galaxphone.id</h4>
        </div>
    </div>
    <v-footer padless>
      <v-col class="text-center" cols="12">
        {{ new Date().getFullYear() }} — <strong>Galaxyphone</strong>
      </v-col>
    </v-footer>
    </v-app>
</template>

<script>
export default {
  name: "Footer",
};
</script>
