<template>
  <v-card class="mx-auto" style="width: 800px" elevation="12" color="#F2F2F2">
    <v-toolbar color="#D95F69">
      <v-card-title class="#white--text">
        <center>Registro</center>
      </v-card-title>
      <v-spacer></v-spacer>
    </v-toolbar>

    <v-form
      ref="formLogin"
      v-model="valid"
      class="pa-3 pt-4"
      lazy-validation
      color="#ccf2f4"
    >
      <v-spacer></v-spacer>

      <v-row>
        <v-col cols="12" md="6">
          <v-select
            solo-inverted
            hide-details
            :items="tipoId"
            label="Tipo de identificacion"
            v-model="usuario.tipoId"
          ></v-select>
        </v-col>
        <v-col cols="12" md="6">
          <v-text-field
            v-model="usuario.numeroId"
            :rules="rules.required"
            label="Numero de identificacion"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="usuario.nombres"
            :rules="rules.required"
            label="Nombres"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="usuario.apellidos"
            :rules="rules.required"
            label="Apellidos"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="usuario.celular"
            :rules="rules.required"
            label="Celular"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="usuario.correo"
            :rules="rules.required"
            label="Correo"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="usuario.password"
            :rules="rules.required"
            label="Password"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="4">
          <v-select
            solo-inverted
            hide-details
            :items="rol"
            label="Rol"
            v-model="usuario.rol"
          ></v-select>
        </v-col>
      </v-row>
    </v-form>
    <v-divider></v-divider>
    <v-card-actions class="justify-center">
      <v-row>
        <v-col cols="12" md="4"> </v-col>
        <v-col cols="12" md="4">
          <v-btn primary block elevation="7" color="#F29544"> Registrar </v-btn>
        </v-col>
      </v-row>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  data: () => ({
    valid: true,
    usuario: {
      tipoId: "",
      numeroId: "",
      nombres: "",
      apellidos: "",
      celular: "",
      correo: "",
      password: "",
      rol: "",
    },
    tipoId: [
      "Cedula",
      "Tarjeta de identidad",
      "Registro civil",
      "Cedula extranjera",
      "Pasaporte",
    ],
    rol: ["Administrador", "Coordinador", "Usuario"],
    admin: { codigo: "" },
    rules: {
      required: [(v) => !!v || "El campo es obligatorio"],
    },
  }),

  methods: {},
};
</script>

<style>
</style>