<template>
  <v-container fill-height>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <center>
          <v-spacer></v-spacer>
          <componenteVerUsuarios/>
        </center>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import componenteVerUsuarios from "../../components/VerUsuarios.vue";
export default {
  layout: "Coordinador",
  components: {
    componenteVerUsuarios,
  },
};
</script>

<style>

</style>