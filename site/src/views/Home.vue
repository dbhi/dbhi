<template>
<v-container fill-height fluid>
  <v-row
    class="mt-auto flex-column"
    no-gutters
  >
    <v-col>
    <h1 class="display-4 font-weight-bold mb-5" align="center">
      DBHI
    </h1>
    </v-col>
    <v-col>
    <h1 class="display-2 font-weight-bold mb-5" align="center">
      Dynamic Binary Hardware Injection
    </h1>
    </v-col>
    <v-col>
    <h2 class="title mb-5" align="center">
      {{ $t("description") }}
    </h2>
    </v-col>
  </v-row>
  <v-row
    justify="center"
    class="mb-auto flex-column"
    no-gutters
  >
    <v-col class="shrink" align="center">
      <v-tooltip right>
        <template v-slot:activator="{ on }">
          <v-btn
            href="https://github.com/dbhi/dbhi"
            target="_blank"
            v-on="on"
            class="ma-1 mb-5"
            tile
            color="primary"
          >
            <v-icon left>mdi-github-box</v-icon>
            dbhi/dbhi
          </v-btn>
        </template>
        <span>Source: github.com/dbhi/dbhi</span>
      </v-tooltip>
    </v-col>
    <v-col class="shrink" align="center">
      <v-tooltip bottom v-for="item in refs" :key="item.name">
        <template v-slot:activator="{ on }">
          <v-btn
            :href="'https://github.com/' + item.ref"
            target="_blank"
            v-on="on"
            class="ma-1"
            tile
            text
            outlined
          >
            <v-icon left>mdi-github-circle</v-icon>
            {{ item.name }}
          </v-btn>
        </template>
        <span>Repository: github.com/{{ item.ref }}</span>
      </v-tooltip>
    </v-col>
  </v-row>
</v-container>
</template>

<script>
export default {
  name: 'Home',
  data: () => ({
    refs: [
      {
        name: "GHDL",
        ref: "ghdl/ghdl"
      },
      {
        name: "VUnit",
        ref: "dbhi/vunit"
      },
      {
        name: "MAMBO",
        ref: "dbhi/mambo"
      },
      {
        name: "DynamoRIO",
        ref: "DynamoRIO/dynamorio"
      },
      {
        name: "gRPC",
        ref: "dbhi/gRPC"
      },
      {
        name: "docker",
        ref: "dbhi/docker"
      },
      {
        name: "qus",
        ref: "dbhi/qus"
      }
    ]
  })
};
</script>
