<template>
  <v-container fill-height>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <center>
          <v-spacer></v-spacer>
          <componenteDetallesUsuario :id_usuario="id"></componenteDetallesUsuario>
        </center>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import componenteDetallesUsuario from "../../components/DetallesUsuario.vue";
export default {
  async asyncData({ params }) {
    let id = params.id;
    return { id };
  },
  layout: "Coordinador",
  components: {
    componenteDetallesUsuario,
  },
};
</script>

<style>
</style>