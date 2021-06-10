<template>
  <v-container fill-height>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <center>
          <v-spacer></v-spacer>
          <componenteDialog :icono="true" :estadoDialog="true" :tituloMensaje="'Operacion exitosa'" :mensaje="'El usuario se ha agregado exitosamente'"/>
        </center>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import componenteDialog from "../components/Dialog.vue";
export default {
  layout: "UsuarioGeneral",
  components: {
    componenteDialog,
  },
};
</script>

<style>
</style>