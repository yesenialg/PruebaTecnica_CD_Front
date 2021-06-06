<template>
  <v-card class="mx-auto" style="width: 600px" elevation="12" color="#F2F2F2">
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
          <v-btn primary large block elevation="7" color="#F29544">
            Ingresar
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
            @click="irRegistro()"
          >
            ¿No tienes una cuenta?
          </v-btn>
        </v-col>
      </v-row>
    </v-card-actions>
    <v-spacer></v-spacer>
  </v-card>
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
    async irRegistro() {
      this.$router.push("registro");
    },
  },
};
</script>
