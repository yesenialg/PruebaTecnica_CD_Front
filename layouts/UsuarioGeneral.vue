<template>
  <v-app style="#BFB99B">
    <v-app-bar :clipped-left="clipped" fixed app color="#F2E18D">
      <v-row>
        <v-col cols="12" md="4"> </v-col>
        <v-col cols="12" md="4">
          <center>
            <h1>
              <v-btn elevation="0" color="#F2E18D" @click="registrar()">
                <v-icon> mdi-clipboard-edit-outline </v-icon>
              </v-btn>
              Bienvenido
              <v-btn elevation="0" color="#F2E18D" @click="iniciarSesion()">
                <v-icon> mdi-exit-to-app </v-icon>
              </v-btn>
            </h1>
          </center>
        </v-col>
      </v-row>
    </v-app-bar>
    <v-main>
      <nuxt />
    </v-main>
    <v-footer :absolute="!fixed" app>
      <v-spacer></v-spacer>
      <span> &copy; {{ new Date().getFullYear() }}</span>
      <small>| Yesenia López</small>
      <v-spacer></v-spacer>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  methods: {
    iniciarSesion() {
      this.$router.push("../login");
    },
    registrar() {
      this.$router.push("../registro");
    },
  },
};
</script>

<style>
#app {
  background: #bfb99b;
  background-size: cover;
}
</style>
