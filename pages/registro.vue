<template>
  <v-container fill-height>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <center>
          <v-spacer></v-spacer>
          <componenteRegistro  regresar="/"/>
        </center>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import componenteRegistro from "../components/Registro";
export default {
  layout: "UsuarioGeneral",
  components: {
    componenteRegistro,
  },
};
</script>

<style>
</style>