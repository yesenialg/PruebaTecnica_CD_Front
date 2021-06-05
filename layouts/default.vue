<template>
  <v-app style="#BFB99B">
    <br />
    <center>
      <h1 style="font-family: Copperplate">Prueba Técnica</h1>
    </center>
    <br />

    <v-footer :absolute="!fixed" app>
      <v-spacer></v-spacer>
      <span> &copy; {{ new Date().getFullYear() }}</span>
      <small>| Yesenia López</small>
      <v-spacer></v-spacer>
    </v-footer>

    <template>
      <v-card
        class="mx-auto"
        style="width: 400px"
        elevation="12"
        color="#F2F2F2"
      >
        <v-toolbar color="#D95F69">
          <v-card-title class="#white--text">
            <center>Iniciar sesion</center>
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

          <v-text-field
            v-model="usuario.correo"
            :rules="rules.required"
            label="Correo"
            style="height: 100px"
            required
          ></v-text-field>

          <v-text-field
            v-model="usuario.password"
            :rules="rules.required"
            label="Contraseña"
            style="height: 100px"
            type="password"
            required
          ></v-text-field>

          <v-select
            solo-inverted
            hide-details
            :items="rol"
            label="Elegir rol"
            v-model="usuario.rol"
          ></v-select>
        </v-form>
        <v-divider></v-divider>

        <v-card-actions class="justify-center">
          <v-row>
            <v-col cols="12" md="4">
              <v-btn primary large block elevation="7" color="#F2E18D">
                Registrar
              </v-btn>
            </v-col>

            <v-col cols="12" md="4">
              <v-btn
                primary
                large
                block
                color="#0c354a"
                class="ma-1"
                v-bind="attrs"
                v-on="on"
                plain
                @click="login()"
              >
                ¿No tienes una cuenta?
              </v-btn>
            </v-col>
          </v-row>
        </v-card-actions>
        <v-spacer></v-spacer>
      </v-card>
    </template>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    valid: true,
    usuario: {
      correo: "",
      password: "",
      rol: "",
    },
    admin: { codigo: "" },
    rules: {
      required: [(v) => !!v || "El campo es obligatorio"],
    },
    rol: ["Administrador", "Coordinador", "Usuario"],
  }),

  methods: {
    async login() {

    }
  },
};
</script>
<style>
#app {
  background: #bfb99b;
  background-size: cover;
}
</style>
