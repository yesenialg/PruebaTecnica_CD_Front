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
        :rules="rules.emailRules"
        label="Correo"
        style="height: 100px"
        required
      ></v-text-field>

      <v-text-field
            v-model="usuario.password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :rules="[rules.required, rules.min]"
            :type="show1 ? 'text' : 'password'"
            name="input-10-1"
            label="Password"
            style="height: 100px"
            hint="At least 8 characters"
            counter            
            required
            @click:append="show1 = !show1"
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
      show1: false,
      rol: "",
    },
    admin: { codigo: "" },
    rules: {
      required: [(v) => !!v || "El campo es obligatorio"],
      min: v => v.length >= 8 || 'Min 8 characters',
      emailRules: [
        v => !!v || 'El campo es obligatorio',
        v => /.+@.+\..+/.test(v) || 'Correo invalido',
      ],
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
