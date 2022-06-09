<template>
  <v-app>
    <Navbar />
    <div id="app">
      <v-app id="inspire" class="mx-16 mt-10">
        <v-card width="450" class="mt-8 mx-auto">
          <v-card-title class="pb-0 justify-center">
            <h1>Register</h1>
          </v-card-title>
          <v-card-text>
            <v-form @submit.prevent="register" class="px-5">
              <v-text-field
                v-model="nama"
                :error-messages="namaErrors"
                label="Nama"
                required
                @input="$v.nama.$touch()"
                @blur="$v.nama.$touch()"
                prepend-icon="mdi-account-circle"
              />
              <v-text-field
                v-model="email"
                :error-messages="emailErrors"
                label="Email"
                required
                @input="$v.email.$touch()"
                @blur="$v.email.$touch()"
                prepend-icon="mdi-mail"
              />
              <v-text-field
                v-model="no_hp"
                :error-messages="no_hpErrors"
                label="No. Telephone"
                required
                @input="$v.no_hp.$touch()"
                @blur="$v.no_hp.$touch()"
                prepend-icon="mdi-phone"
              />
              <v-textarea
                v-model="alamat"
                :error-messages="alamatErrors"
                label="Alamat"
                required
                @input="$v.alamat.$touch()"
                @blur="$v.alamat.$touch()"
                prepend-icon="mdi-map-marker"
              />
              <v-text-field
                v-model="password"
                :type="showPassword ? 'text' : 'password'"
                :error-messages="passwordErrors"
                label="Password"
                required
                @input="$v.password.$touch()"
                @blur="$v.password.$touch()"
                prepend-icon="mdi-lock"
                :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="showPassword = !showPassword"
              />
              <v-text-field
                v-model="confirmPassword"
                :type="showPassword ? 'text' : 'password'"
                :error-messages="confirmPasswordErrors"
                label="Password"
                required
                @input="$v.confirmPassword.$touch()"
                @blur="$v.confirmPassword.$touch()"
                prepend-icon="mdi-lock"
                :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="showPassword = !showPassword"
              />
            </v-form>
          </v-card-text>
          <v-divider></v-divider>
          <v-card-actions class="my-1 d-flex justify-center mt-10">
            <v-btn @click="register" class="ml-5 success">Register</v-btn>
            <v-btn @click="cancel" class="ml-5 Info">Cancel</v-btn>
          </v-card-actions>
          <v-card-bottom class="d-flex justify-center">
            <v-card-title style="font-size: 12px"
              >www.galaxyphone.id</v-card-title
            >
          </v-card-bottom>
        </v-card>
      </v-app>
    </div>
    <Footer />
  </v-app>
</template>
<script>
// import HelloWorld from '../components/HelloWorld'
import Navbar from "../components/Navbar";
import { validationMixin } from "vuelidate";
import { required, minLength, email } from "vuelidate/lib/validators";
import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios);

export default {
  nama: "Registrasi",
  mixins: [validationMixin],
  validations: {
    nama: { required, minLength: minLength(2) },
    email: { required, email },
    no_hp: { required, minLength: minLength(2) },
    alamat: { required, minLength: minLength(2) },
    password: { required, minLength: minLength(2) },
  },
  components: {
    Navbar,
  },
  data() {
    return {
      nama: this.nama,
      email: this.email,
      no_hp: this.no_hp,
      alamat: this.alamat,
      password: this.password,
      status: null,
      showPassword: false,
      listProfil: [],
    };
  },
  methods: {
    register() {
      if (
        this.nama &&
        this.email &&
        this.no_hp &&
        this.alamat &&
        this.password
      ) {
        try {
          Vue.axios
            .post("http://localhost/galaxyphone/api/pelanggan/create.php", {
              email: this.email,
              password: this.password,
              nama_lengkap: this.nama,
              alamat_pengiriman: this.alamat,
              no_hp: this.no_hp,
            })
            .then((response) => {
              alert("data berhasil disimpan");
              this.hapusIDKosong()
              return this.$router.push({ path: "/"});
            });
        } catch (error) {
          alert("data tidak berhasil disimpan");
          location.reload();
        }
      } else {
        alert("mohon masukan semua data");
      }
    },
    cancel() {
      return this.$router.push({ path: "/" });
    },
    hapusIDKosong(){
     Vue.axios
        .delete('http://localhost/galaxyphone/api/pelanggan/delete.php',{
          no_hp : 0,
        })
        .then(() => {
        });
    },
  },
  mounted(){

  },
  computed: {
    namaErrors() {
      const errors = [];
      if (!this.$v.nama.$dirty) return errors;
      !this.$v.nama.minLength &&
        errors.push("Nama must be at least 4 characters long.");
      !this.$v.nama.required && errors.push("Nama is required.");
      return errors;
    },
    no_hpErrors() {
      const errors = [];
      if (!this.$v.no_hp.$dirty) return errors;
      !this.$v.no_hp.minLength &&
        errors.push("nomer handphone must be at least 4 characters long.");
      !this.$v.no_hp.required && errors.push("no handphone is required.");
      return errors;
    },
    alamatErrors() {
      const errors = [];
      if (!this.$v.alamat.$dirty) return errors;
      !this.$v.alamat.minLength &&
        errors.push("alamat must be at least 4 characters long.");
      !this.$v.alamat.required && errors.push("alamat is required.");
      return errors;
    },
    emailErrors() {
      const errors = [];
      if (!this.$v.email.$dirty) return errors;
      !this.$v.email.email && errors.push("Must be valid e-mail");
      !this.$v.email.required && errors.push("E-mail is required");
      return errors;
    },
    passwordErrors() {
      const errors = [];
      if (!this.$v.password.$dirty) return errors;
      !this.$v.password.minLength &&
        errors.push("Password must be at least 8 characters long");
      !this.$v.password.required && errors.push("Password is required");
      return errors;
    },
  },
};
</script>
