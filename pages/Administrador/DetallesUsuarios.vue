<template>
  <v-container fill-height>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <center>
          <v-spacer></v-spacer>
          <componenteDetallesUsuario/>
        </center>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import componenteDetallesUsuario from "../../components/DetallesUsuario";
export default {
  layout: "Administrador",
  components: {
    componenteDetallesUsuario,
  },
};
</script>

<style>

</style>