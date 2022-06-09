<template>
  <v-app>
    <Navbar />
    <div class="col-12 mb-16">
      <h1 class="mx-15 my-10">
        <strong class="mr-5 blue--text">Pembayaran</strong
        ><v-icon large color="blue">mdi-credit-card-outline</v-icon>
      </h1>
      <!-- table -->
      <v-card elevation="2" rounded class="mb-16 mx-15">
        <template>
          <v-simple-table>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-left">Image</th>
                  <th class="text-left">Nama</th>
                  <th class="text-left">Harga</th>
                  <th class="text-left">Jumlah</th>
                  <th class="text-left">Total Harga</th>
                  <!-- <th class="text-left">id</th>
                        <th class="text-left">Aksi</th> -->
                </tr>
              </thead>
              <tbody>
                <tr v-for="n in listKeranjang" :key="n.id">
                  <td>
                    <v-img
                      :src="n.gambar_utama"
                      eager
                      max-width="100"
                      max-height="100"
                      class="white--text align-end my-3"
                    />
                  </td>
                  <td>{{ n.nama }}</td>
                  <td>Rp. {{ n.harga | formatNumber }}</td>
                  <td>{{ n.jumlah }}</td>
                  <td>Rp. {{ n.total_harga | formatNumber }}</td>
                  <!-- <td>{{ n.id}}</td> -->
                  <!-- <td>
                          <v-btn small color="error" dark class="my-3" @click="hapusKeranjang(n.id, n.pelanggan_id)">
                            batal
                          </v-btn>
                        </td> -->
                </tr>
              </tbody>
            </template> </v-simple-table
          ><v-form>
            <v-card class="mt-16">
              <div class="row mx-10 d-flex justify-center">
                <v-text-field
                  class="mt-5 blue--text text-h6"
                  :value="'Nama penerima: '+this.nama"
                  readonly
                ></v-text-field>
              </div>
              <!-- memasukan alamat opsional -->
              <div class="row mx-10 d-flex justify-center">
                <v-textarea
                  class="mt-5"
                  ref="alamat"
                  v-model="alamat"
                  label="Alamat Penerima *opsional (jika kosong maka secara random menggunakan
                      alamat pelanggan)"
                  required
                  placeholder="Cth. Kebun sari no 12 RT02/RW02 Kecamatan Ragunan Jakarta Selatan"
                  width="1000"
                ></v-textarea>
              </div>
              <div class="row mx-7 my-2">
                <v-container fluid>
                  <v-combobox
                    v-model="alamat_pengiriman_pelanggan"
                    :items="metode"
                    item-value="id"
                    item-text="label"
                    :return-object="true"
                    label="Metode Pembayaran *wajib diisi"
                    filled
                  ></v-combobox>
                </v-container>
              </div>
              <div class="row mx-7 my-2">
                <div class="col d-flex justify-end">
                  <h2 class="mr-8 blue-grey--text">
                    sub total<v-icon x-large class="blue-grey--text"
                      >mdi-cash</v-icon
                    >
                  </h2>
                  <h2 class="blue--text">Rp. {{ subTotal | formatNumber }}</h2>
                </div>
              </div>
              <div class="row mx-7 my-7 d-flex justify-end">
                <v-btn
                  large
                  color="success"
                  dark
                  @click="insertDataPesanan()"
                  class="my-3"
                >
                  Check Out
                </v-btn>
              </div>
            </v-card>
          </v-form>
        </template>
      </v-card>
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
      listKeranjang: [],
      subTotal: "",
      listTotal: [],
      totalHarga: [],
      form: {},
      listPelanggan: [],
      address_pelanggan: "",
      metode: [
        { id: 1, label: "TRANSFER", value: "TRANSFER" },
        { id: 2, label: "COD", value: "COD" },
      ],
      alamat: this.alamat,
      metode_pembayaran: this.alamat_pengiriman_pelanggan,
      listIDPesanan: [],
      idMaxPesanan: "",
      error: "",
      listUpdateProduk:[],
      stockUpdate: '',
      hasilPenjualanUpdate: '',
      listProfil:[],
      nama : '',
    };
  },
  mounted() {
    this.getProduk();
    this.hapusIdKosong();
    this.subTotalHarga();
    this.idPelanggan();
    this.findIDMax();
    this.showName();
  },
  methods: {
    getProduk() {
      Vue.axios
        .get(
          "http://localhost/galaxyphone/api/keranjang/list.php?id=" +
            this.$route.params.no
        )
        .then((response) => {
          this.listKeranjang = response.data;
          console.log(this.listKeranjang);
        });
    },
    subTotalHarga() {
      Vue.axios
        .get(
          "http://localhost/galaxyphone/api/keranjang_info/list.php?pelanggan_id=" +
            this.$route.params.no
        )
        .then((response) => {
          this.totalHarga = response.data[0];
          this.subTotal = this.totalHarga["total"];
          console.log(this.totalHarga);
        });
    },
    hapusIdKosong() {
      Vue.axios
        .delete(
          "http://localhost/galaxyphone/api/keranjang_info/delete.php?pelanggan_id=0"
        )
        .then(() => {});
    },
    idPelanggan() {
      Vue.axios
        .get(
          "http://localhost/galaxyphone/api/pelanggan_info/detail.php?id=" +
            this.$route.params.no
        )
        .then((response) => {
          this.listPelanggan = response.data;
          this.address_pelanggan = this.listPelanggan["alamat_pengiriman"];
          console.log(this.address_pelanggan);
        });
    },
    findIDMax() {
      Vue.axios
        .get("http://localhost/galaxyphone/api/pesanan_info/list.php")
        .then((response) => {
          this.listIDPesanan = response.data[0];
          this.idMaxPesanan = parseInt(this.listIDPesanan["id"])+2;
          console.log(this.idMaxPesanan);
        });
    },
    insertDetailPesanan() {
      let panjang_list = this.listKeranjang.length;
      for (let i = 0; i < panjang_list; i++) {
        Vue.axios
          .post("http://localhost/galaxyphone/api/detail_pesanan/create.php", {
            pesanan_id: this.idMaxPesanan,
            produk_id: this.listKeranjang[i]["produk_id"],
            harga: this.listKeranjang[i]["harga"],
            kuantitas: this.listKeranjang[i]["jumlah"],
          })
          .then(() => {
            this.updateStockProduk(i);
            this.hapusIdKeranjang();
            return this.$router.push({
              path: "/home/" + this.$route.params.no,
            });

          });
      }
      //   alert(this.listKeranjang[0]["nama"]);
    },
    //update produk
    updateStockProduk(i){
        Vue.axios
          .post("http://localhost/galaxyphone/api/produk_table/detail.php?id="+ this.listKeranjang[i]["produk_id"])
          .then((response) => {
            this.listUpdateProduk = response.data
            this.stockUpdate = this.listUpdateProduk['stock']
            this.hasilPenjualanUpdate = this.listUpdateProduk['hasil_penjualan']
            let stockTemporary = this.stockUpdate-this.listKeranjang[i]['jumlah']
            let hasilTemporary = parseInt(this.hasilPenjualanUpdate)+parseInt(this.listKeranjang[i]['jumlah'])
            this.updateTableProduk(this.listKeranjang[i]['produk_id'],stockTemporary,hasilTemporary)
            console.log(stockTemporary+" "+hasilTemporary)
            
          });
    },
    updateTableProduk(id, stock, hasil){
      Vue.axios
        .put("http://localhost/galaxyphone/api/produk_table/update.php", {
          id : id,
          stock : stock,
          hasil_penjualan : hasil
        })
        .then(() => {
        });
    },
    insertDataPesanan() {
      const today = new Date();
      const date =
        today.getFullYear() +
        "-" +
        (today.getMonth() + 1) +
        "-" +
        today.getDate();
      if (this.alamat) {
        try {
          Vue.axios
            .post("http://localhost/galaxyphone/api/pesanan/create.php", {
              pelanggan_id: this.$route.params.no,
              jumlah_biaya: this.subTotal,
              alamat_pengiriman: this.alamat,
              tanggal_pemesanan: date,
              metode_pembayaran: this.alamat_pengiriman_pelanggan["value"],
            })
            .then(() => {
              this.insertData();
            });
        } catch (error) {
          this.error = "terjadi error";
        }
      } else {
        try {
          Vue.axios
            .post("http://localhost/galaxyphone/api/pesanan/create.php", {
              pelanggan_id: this.$route.params.no,
              jumlah_biaya: this.subTotal,
              alamat_pengiriman: this.address_pelanggan,
              tanggal_pemesanan: date,
              metode_pembayaran: this.alamat_pengiriman_pelanggan["value"],
            })
            .then(() => {
              this.insertData();
            });
        } catch (error) {
          this.error = "terjadi error";
        }
      }
    },
    insertData() {
      this.insertDetailPesanan();
      alert("pembayaran berhasil, terima kasih sudah membeli di toko kami");
    },
    hapusIdKeranjang() {
      Vue.axios
        .delete(
          "http://localhost/galaxyphone/api/keranjang_info/delete.php?pelanggan_id="+this.$route.params.no
        )
        .then(() => {});
    },
    showName(){
      Vue.axios
        .get(
          "http://localhost/galaxyphone/api/pelanggan_info/detail.php?id="+this.$route.params.no
        )
        .then((response) => {
          this.listProfil = response.data;
          this.nama = this.listProfil['nama_lengkap']
          console.log(this.listProfil);
        });
    }
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
