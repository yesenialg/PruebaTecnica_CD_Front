<template>
  <v-container fill-height>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <center>
          <v-spacer></v-spacer>
          <componenteLogin />
        </center>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import componenteLogin from "../components/Login.vue";
export default {
  layout: "UsuarioGeneral",
  components: {
    componenteLogin,
  },
};
</script>

<style>
</style>