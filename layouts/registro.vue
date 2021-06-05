<template>
  <v-app style="#BFB99B">
    <v-footer :absolute="!fixed" app>
      <v-spacer></v-spacer>
      <span> &copy; {{ new Date().getFullYear() }}</span>
      <small>| Yesenia López</small>
      <v-spacer></v-spacer>
    </v-footer>

    <template>
      <v-spacer></v-spacer>
      <v-card
        class="mx-auto"
        style="width: 800px"
        elevation="12"
        color="#F2F2F2"
      >
        <v-toolbar color="#D95F69">
          <v-card-title class="justify-center"> Registro </v-card-title>
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
                :items="identificacion"
                label="Tipo de identificación"
                v-model="usuario.tipoId"
              ></v-select>
            </v-col>

            <v-col cols="12" md="6">
              <v-text-field
                v-model="usuario.id"
                :rules="rules.required"
                label="Numero de identificación"
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
                label="Contraseña"
                style="height: 100px"
                type="password"
                required
              ></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-select
                solo-inverted
                hide-details
                :items="rol"
                label="Elegir rol"
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
              <v-btn primary large block elevation="7" color="#F2E18D">
                Registrar
              </v-btn>
            </v-col>
          </v-row>
        </v-card-actions>
        <v-spacer></v-spacer>
      </v-card>
      <v-spacer></v-spacer>
    </template>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    valid: true,
    usuario: {
      tipoId: "",
      id: "",
      nombres: "",
      apellidos: "",
      celular: "",
      correo: "",
      password: "",
      rol: "",
    },
    admin: { codigo: "" },
    rules: {
      required: [(v) => !!v || "El campo es obligatorio"],
    },
    rol: ["Administrador", "Coordinador", "Usuario"],
    identificacion: [
      "Cedula",
      "Tarjeta de identidad",
      "Registro civil",
      "Pasaporte",
      "Cedula de extranjero",
    ],
  }),

  methods: {},
};
</script>
<style>
#app {
  background: #bfb99b;
  background-size: cover;
}
</style>
