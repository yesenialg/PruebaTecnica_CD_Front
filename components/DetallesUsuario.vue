<template>
  <v-card class="overflow-hidden">
    <v-toolbar flat>
      <v-toolbar-title class="#0c354a">Datos personales</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        class="white--text"
        color="#F29544"
        fab
        small
        @click="isEditing = !isEditing"
      >
        <v-icon v-if="isEditing"> mdi-close </v-icon>
        <v-icon v-else> mdi-pencil </v-icon>
      </v-btn> 
      <h1 class="white--text"> ~ </h1>
      <v-btn
        class="white--text"
        color="#F29544"
        fab
        small
        @click="deleteUser()"
      >
        <v-icon> mdi-trash-can </v-icon>
      </v-btn>
    </v-toolbar>
    <v-card-text>
      <v-form ref="Usuario" v-model="valid" lazy-validation>
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
            label="Rol"
            v-model="usuario.rol"
          ></v-select>
        </v-col>
      </v-row>
      </v-form>
    </v-card-text>
    <v-divider></v-divider>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn
        class="white--text"
        :disabled="!isEditing"
        color="#F29544"
        @click="updateUsuario"
      >
        Guardar
      </v-btn>
    </v-card-actions>
    <v-snackbar v-model="hasSaved" :timeout="2000" absolute bottom left>
      Datos actualizados!
    </v-snackbar>
  </v-card>
</template>


<script>
export default {
  layout: "usuario",
  data: () => ({
    valid: true,
    hasSaved: false,
    isEditing: null,
    model: null,
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
    rules: {
      required: [(v) => !!v || "El campo es obligatorio"],
      min: v => v.length >= 8 || 'Min 8 characters',
      emailRules: [
        v => !!v || 'El campo es obligatorio',
        v => /.+@.+\..+/.test(v) || 'Correo invalido',
      ],
    },
    
  }),

  methods: {
    deleteUser(){

    },
  },
};
</script>
<style>
</style>