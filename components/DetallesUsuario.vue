<template>
  <v-card class="overflow-hidden">
    <v-toolbar flat>
      <v-toolbar-title class="#0c354a">Datos personales</v-toolbar-title>
      <v-spacer></v-spacer>

      <div class="text-center">
        <v-dialog v-model="dialog" width="500">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              class="white--text"
              color="#F29544"
              fab
              small
              v-bind="attrs"
              v-on="on"
              v-if="admin"
            >
              <v-icon> mdi-trash-can </v-icon>
            </v-btn>
          </template>

          <v-card>
            <v-card-title color="#F29544"> Eliminar usuario </v-card-title>

            <v-card-text>
              ¿Esta seguro de eliminar este usuario? No podrá recuperarlo y le
              restringirá el acceso.
            </v-card-text>

            <v-divider></v-divider>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="#F2E18D" text @click="eliminarUsuario()">
                Sí
              </v-btn>
              <v-btn color="#D95F69" text @click="dialog = false"> No </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </div>
    </v-toolbar>
    <v-card-text>
      <v-form ref="Usuario" v-model="valid" lazy-validation>
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
              :rules="rules.required"
              hide-details
              :items="rol"
              label="Rol"
              v-model="usuario.rol"
              required
            ></v-select>
          </v-col>
        </v-row>
      </v-form>
    </v-card-text>
    <v-divider></v-divider>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn class="white--text" color="#F29544" @click="actualizarUsuario()">
        Guardar
      </v-btn>
      <v-btn class="white--text" color="#D95F69" @click="verUsuarios()">
        Cancelar
      </v-btn>
    </v-card-actions>
    <v-snackbar v-model="hasSaved" :timeout="2000" absolute bottom left>
      Datos actualizados!
    </v-snackbar>
  </v-card>
</template>


<script>
export default {
  props: ["admin", "id_usuario"],
  data: () => ({
    valid: true,
    hasSaved: false,
    dialog: false,
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
      min: (v) => v.length >= 8 || "Min 8 characters",
      emailRules: [
        (v) => !!v || "El campo es obligatorio",
        (v) => /.+@.+\..+/.test(v) || "Correo invalido",
      ],
    },
  }),

  beforeMount() {
    this.verUsuario();
  },

  methods: {
    async eliminarUsuario() {
      try {
          console.log("Inicio eliminar usuario");
          let usuario = Object.assign({}, this.usuario);
          console.log(usuario);
          let response = await this.$axios.delete(
            "http://localhost:3001/personas/" + this.id_usuario
          );
        } catch (error) {
          console.log(error);
        }
      this.$router.push("../Administrador/VerUsuarios");
    },
    async actualizarUsuario() {
      if (this.$refs.Usuario.validate()) {
        try {
          console.log("Inicio actualizar usuario");
          let usuario = Object.assign({}, this.usuario);
          console.log(usuario);
          let response = await this.$axios.put(
            "http://localhost:3001/personas/" + this.id_usuario, usuario
          );
          this.usuario = response.data;
          console.log(response);
        } catch (error) {
          console.log(error);
        }
      } else {
        console.log("Formato incompleto");
      }
    },
    verUsuarios() {
      this.$router.push("../Administrador/");
    },
    async verUsuario() {
      try {
        let response = await this.$axios.get(
          "http://localhost:3001/personas/" + this.id_usuario
        );
        this.usuario = response.data;
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