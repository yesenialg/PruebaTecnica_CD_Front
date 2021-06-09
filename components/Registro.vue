<template>
  <v-card class="mx-auto" style="width: 800px" elevation="12" color="#F2F2F2">
    <v-toolbar color="#D95F69">
      <v-card-title class="#white--text">
        <center>Registro</center>
      </v-card-title>
      <v-spacer></v-spacer>
    </v-toolbar>

    <v-form
      ref="formRegistro"
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
            :rules="rules.required"
            :items="tipoId"
            label="Tipo de identificacion"
            v-model="usuario.tipoId"
            required
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
            type="number"
            required
          ></v-text-field>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="usuario.correo"
            :rules="rules.emailRules"
            label="Correo"
            style="height: 100px"
            required
          ></v-text-field>
        </v-col>
        <v-col cols="12" md="4">
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
        </v-col>
        <v-col cols="12" md="4">
          <v-select
            solo-inverted
            hide-details
            :items="rol"
            :rules="rules.required"
            label="Rol"
            v-model="usuario.rol"
            required
          ></v-select>
        </v-col>
      </v-row>
    </v-form>
    <v-divider></v-divider>
    <v-card-actions class="justify-center">
      <v-row>
        <v-col cols="12" md="4"> </v-col>
        <v-col cols="12" md="4">
          <v-btn
            primary
            block
            elevation="7"
            color="#F29544"
            @click="crearUsuario()"
          >
            Registrar
          </v-btn>
        </v-col>
      </v-row>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  data: () => ({
    valid: true,
    show1: false,
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
      min: (v) => v.length >= 8 || "Min 8 characters",
      emailRules: [
        (v) => !!v || "El campo es obligatorio",
        (v) => /.+@.+\..+/.test(v) || "Correo invalido",
      ],
    },
  }),

  methods: {
    async crearUsuario() {
      if (this.$refs.formRegistro.validate()) {
        console.log("Inicio guardar usuario");
        let usuario = Object.assign({}, this.usuario);
        let response = await this.$axios.post('http://localhost:3001/personas', usuario)
        console.log(response);
      } else {
        console.log("Formato incompleto");
      }
    },
  },
};
</script>

<style>
</style>