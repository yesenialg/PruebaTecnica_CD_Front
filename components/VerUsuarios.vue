<template>
  <v-card>
    <v-toolbar color="#D95F69">
      <v-card-title>
        <v-row>
          <v-col cols="12" md="4">
            <center>Usuarios</center>
            <v-spacer></v-spacer>
          </v-col>
          <v-col cols="12" md="8">
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
          </v-col>
        </v-row>
      </v-card-title>
    </v-toolbar>
    <v-data-table
      :headers="headers"
      :items="usuarios"
      :search="search"
      @click="verDetalles()"
    >
      <template v-slot:top> </template>
      <template v-slot:item.actions="{ item }">
        <v-icon small class="mr-2" @click="verDetalles(item)"> mdi-eye </v-icon>
      </template>
    </v-data-table>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      headers: [
        {
          text: "Nombres",
          align: "start",
          sortable: false,
          value: "nombres",
        },
        { text: "Apellidos", value: "apellidos" },
        { text: "tipo de Identificacion", value: "tipoId" },
        { text: "numero de Identificacion", value: "numeroId" },
        { text: "Correo", value: "correo" },
        { text: "Celular", value: "celular" },
        { text: "Rol", value: "rol" },
        { text: "Actions", value: "actions", sortable: false },
      ],
      usuarios: [],
    };
  },

  beforeMount() {
    this.verUsuarios();
  },

  methods: {
    async verDetalles(item) {
      this.$router.push("" + item.id);
    },
    async verUsuarios() {
      try {
        let response = await this.$axios.get("http://localhost:3001/personas");
        this.usuarios = response.data;
      console.log(response);
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style>
</style>