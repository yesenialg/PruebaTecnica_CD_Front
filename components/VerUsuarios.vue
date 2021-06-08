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
      <template v-slot:item.actions="{item}">
        <v-icon small class = "mr-2" @click="verDetalles(item)"> mdi-eye </v-icon>
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
          value: "name",
        },
        { text: "tipo de Identificacion", value: "tipoId" },
        { text: "numero de Identificacion", value: "id" },
        { text: "Correo", value: "correo" },
        { text: "Celular", value: "celular" },
        { text: "Rol", value: "rol" },
        { text: "Actions", value: "actions", sortable: false },
      ],
      usuarios: [
        {
          name: "Ana Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
        {
          name: "Ana Sanchez",
          lastName: "Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
        {
          name: "Ana Sanchez",
          lastName: "Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
        {
          name: "Ana Sanchez",
          lastName: "Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
        {
          name: "Ana Sanchez",
          lastName: "Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
        {
          name: "Ana Sanchez",
          lastName: "Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
        {
          name: "Ana Sanchez",
          lastName: "Sanchez",
          tipoId: "cedula",
          id: "111222",
          correo: "ana@gmail.com",
          celular: 3463123765,
          rol: "Administrador",
        },
      ],
    };
  },

  methods: {
    async verDetalles() {
      this.$router.push("DetallesUsuarios");
    },
  },
};
</script>

<style>
</style>