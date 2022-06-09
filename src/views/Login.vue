<template>
  <v-app>
    <Navbar />
    <div id="app">
      <v-app id="inspire" class="mx-16 mt-10">
        <v-card width="400" height="500" class="mt-8 mx-auto">
          <v-card-title class="pb-0 justify-center">
          <h1>Login</h1>
          </v-card-title>
          <v-card-text>
            <v-form @submit.prevent="login" class="px-5 mt-16">
              <v-text-field
                v-model= "email"
                :error-messages="emailErrors"
                label="Email"
                required
                @input="$v.email.$touch()"
                @blur="$v.email.$touch()"
                prepend-icon="mdi-mail"
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
            </v-form>
          </v-card-text>
          <v-divider class="mt-16"></v-divider>
          <v-card-actions class="my-1 mt-10 d-lg-flex justify-center">
            <v-btn @click="login()" type="submit" class="ml-5 success pa-4"
              >Login</v-btn
            >
            <v-btn @click="cancel" class="ml-5 Info pa-4">Cancel</v-btn>
          </v-card-actions>
          <v-card-bottom class="d-flex justify-center">
            <v-card-title style="font-size: 12px"
              >www.galaxyphone.id</v-card-title
            >
          </v-card-bottom>
          <h1>{{listProfil.nama}}</h1>
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
  name: "Login",
  mixins: [validationMixin],
  validations: {
    email: { required, email },
    password: { required, minLength: minLength(2) },
  },
  components: {
    Navbar,
  },
  data() {
    return {
      email: this.email,
      password:this.password,
      status: null,
      // output1 : this.$route.params.no,
      // output2 : this.$route.params.id,
      showPassword: false,
      listProfil:[],
      email_db:'',
      password_db:'',
      id_pelanggan: '',
    };
  },
  methods: {
    login(){
      Vue.axios.post("http://localhost/galaxyphone/api/pelanggan/detail.php?email="+this.email)
      .then((response) => {
        this.listProfil = response.data;
          this.email_db = this.listProfil["email"];
          this.password_db = this.listProfil["password"];
          this.id_pelanggan = this.listProfil['id'];
          if(this.email_db === this.email && this.password_db === this.password){
            if(this.email_db === 'admin@gmail.com'){
              return this.$router.push({ path: "/adminproduk/"+this.id_pelanggan });
            }else{
              return this.$router.push({ path: "/home/"+this.id_pelanggan });
            }
          }else{
            location.reload();
          }
           
      });
    },
    cancel() {
      return this.$router.push({ path: "/" });
    },
  },
  computed: {
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
  mounted(){
    // this.login()
  }
};
</script>
