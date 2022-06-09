<template>
  <v-app>
    <NavbarAdmin />
    <div id="app" class="ma-16">
      <div class="row ma-10">
        <v-action>
          <v-btn depressed color="primary" :to="'/adminproduk/'+ this.$route.params.no" class="text-md-h6">
            KEMBALI <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-action>
      </div>
      <v-app id="inspire">
    <v-form>
        <v-row justify="center">
          <v-col cols="12" sm="10" md="8" lg="6">
            <v-card ref="form">
              <v-card-text>
                <v-text-field
                  ref="nama"
                  v-model="form.nama"
                  :rules="[() => !!form.nama || 'This field is required']"
                  :error-messages="errorMessages"
                  label="Nama Produk"
                  placeholder="Cth. Samsung"
                  required
                  counter="25"
                ></v-text-field>
                <v-text-field
                  ref="harga"
                  v-model="form.harga"
                  :rules="[
                    () => !!form.harga || 'This field is required',
                  ]"
                  label="Harga Produk"
                  placeholder="Cth. 8000000"
                  required
                ></v-text-field>
                <v-text-field
                  ref="berat"
                  v-model="form.berat"
                  :rules="[
                    () => !!form.berat || 'This field is required',
                    addressCheck,
                  ]"
                  label="Berat"
                  placeholder="Cth. 800"
                  required
                ></v-text-field>
                <v-text-field
                  ref="deskripsi"
                  v-model="form.deskripsi"
                  :rules="[() => !!form.deskripsi || 'This field is required']"
                  label="Deskripsi Produk"
                  required
                  placeholder="Cth. Produk terbaru ..."
                ></v-text-field>
                <v-textarea
                  v-model="form.spesifikasi"
                  label="Spesifikasi Produk"
                  autocomplete="spesifikasi"
                  :rules="[() => !!form.spesifikasi || 'This field is required']"
                ></v-textarea>
                <v-text-field
                  ref="stock"
                  v-model="form.stock"
                  :rules="[() => !!form.stock || 'This field is required']"
                  label="Stock"
                  required
                  placeholder="Cth. 80"
                ></v-text-field>
                <v-text-field
                  ref="gambar_utama"
                  v-model="form.gambar_utama"
                  :rules="[() => !!form.gambar_utama || 'This field is required']"
                  label="Gambar Produk"
                  required
                  placeholder="Cth. Samsung.jpg"
                ></v-text-field>
                <v-text-field
                  ref="hasil_penjualan"
                  v-model="form.hasil_penjualan"
                  :rules="[() => !!form.hasil_penjualan || 'This field is required']"
                  label="Hasil penjualan"
                  placeholder="Cth. diisi 0 saja"
                ></v-text-field>
                <v-menu
                  ref="menu"
                  v-model="form.menu"
                  :close-on-content-click="false"
                  :return-value.sync="form.tanggal_barang_masuk"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="form.tanggal_barang_masuk"
                      label="Tanggal Input Data"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker v-model="date" no-title scrollable>
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu = false">
                      Cancel
                    </v-btn>
                    <v-btn text color="primary" @click="$refs.menu.save(date)">
                      OK
                    </v-btn>
                  </v-date-picker>
                </v-menu>
              </v-card-text>
              <v-divider class="mt-12"></v-divider>
              <!-- button -->
              <v-card-actions>
                <v-btn text :to="'/adminproduk/'+this.$route.params.no"> Cancel </v-btn>
                <v-spacer></v-spacer>
                <v-slide-x-reverse-transition>
                  <v-tooltip v-if="formHasErrors" left>
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        icon
                        class="my-0"
                        v-bind="attrs"
                        @click="resetForm"
                        v-on="on"
                      >
                        <v-icon>mdi-refresh</v-icon>
                      </v-btn>
                    </template>
                    <span>Refresh form</span>
                  </v-tooltip>
                </v-slide-x-reverse-transition>
                <v-btn color="primary" text @click="tambahProduk()"> Submit </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
    </v-form>
      </v-app>
    </div>
    <Footer/>
  </v-app>
</template>
<script>
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
import NavbarAdmin from "../components/NavbarAdmin.vue";
import Footer from '../components/Footer.vue';
Vue.use(VueAxios, axios);

export default {
  name: "AdminTambahProduk",

  components: {
    NavbarAdmin,
    Footer,
  },
  data() {
    return {
      form: {},
    };
  },
  mounted() {
  },
  methods: {
   tambahProduk() {
      Vue.axios
        // .post("http://localhost/galaxyphone/api/produk/create.php", {
        //   nama: "123",
        //   harga: "123",
        //   berat: "123",
        //   deskripsi: "123",
        //   spesifikasi: "1232",
        //   stock: "123",
        //   hasil_penjualan : "123",
        //   tanggal_barang_masuk : '2022-06-09'
        // })
        .post("http://localhost/galaxyphone/api/produk/create.php", this.form)
        .then(() => {
          alert('produk berhasil ditambahkan')
            this.$router.push({ path: '/adminproduk/'+this.$route.params.no });
        });
    },
  },
};
</script>
