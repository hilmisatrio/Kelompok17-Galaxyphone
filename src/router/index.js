import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ListProduk from '../views/ListProduk.vue'
import ListKategori from '../views/ListKategori.vue'
import DetailProduk from '../views/DetailProduk.vue'
import Keranjang from '../views/Keranjang.vue'
import AdminTableProduk from '../views/AdminTableProduk.vue'
import AdminTablePelanggan from '../views/AdminTablePelanggan.vue'
import AdminTambahProduk from '../views/AdminTambahProduk.vue'
import AdminUpdateProduk from '../views/AdminUpdateProduk.vue'
import Login from '../views/Login.vue'
import Registrasi from '../views/Registrasi.vue'
import AdminTransaksi from '../views/AdminTransaksi.vue'
import Pembayaran from '../views/Pembayaran.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home/:no',
    name: 'home',
    component: HomeView
  },
  {
    path : '/list/:no',
    name : 'list',
    component: ListProduk
  },
  {
    path : '/listkategori/:id/:no',
    name : 'listkategori',
    component: ListKategori
  },
  {
    path : '/detail/:id/:no',
    name : 'detail',
    component: DetailProduk
  },
  {
    path : '/keranjang/:no',
    name : 'keranjang',
    component: Keranjang
  },
  {
    path : '/pembayaran/:no',
    name : 'pembayaran',
    component: Pembayaran
  },
  {
    path : '/adminpelanggan/:no',
    name : 'adminpelanggan',
    component: AdminTablePelanggan
  },
  {
    path : '/admintambahproduk/:no',
    name : 'admintambahproduk',
    component: AdminTambahProduk
  },
  {
    path : '/adminupdateproduk/:id/:no',
    name : 'adminupdateproduk',
    component: AdminUpdateProduk
  },
  {
    path : '/adminproduk/:no',
    name : 'adminproduk',
    component: AdminTableProduk
  },
  {
    path : '/admintransaksi/:no',
    name : 'admintransaksi',
    component: AdminTransaksi
  },
  {
    // path : '/login/:id/:no',
    path : '/',
    name : 'login',
    component: Login
  },
  {
    path : '/registrasi',
    name : 'registrasi',
    component: Registrasi
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
