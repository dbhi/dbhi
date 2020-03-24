<template>
<v-app-bar
  app
  dense
  flat
>

  <!--
  <template v-if="!drawer">
  <v-app-bar-nav-icon tile @click.stop="toggleDrawer" />
  <v-divider vertical/>
  </template>
  -->

  <!-- DASHBOARD -->

  <v-tooltip bottom>
    <template v-slot:activator="{ on }">
      <v-btn class="mr-1" tile text v-on="on" to="/" :block="false">
        <v-icon left>mdi-home</v-icon>
        DBHI
      </v-btn>
    </template>
    <span>Home</span>
  </v-tooltip>

  <v-tooltip bottom>
    <template v-slot:activator="{ on }">
      <v-btn class="ml-1" tile text v-on="on" href="pdf/FPGA2020_poster.pdf">
        <v-icon left>mdi-school</v-icon>
        FPGA 2020
      </v-btn>
    </template>
    <span>Home</span>
  </v-tooltip>

  <v-spacer></v-spacer>

  <!-- Language selector -->
  <!--
  <v-select
    :items="Object.keys($i18n.messages)"
    label="Language"
    v-model="$i18n.locale"
  ></v-select>
  -->

  <v-tooltip bottom>
    <template v-slot:activator="{ on }">
  <v-btn tile text v-on="on"
    @click="$vuetify.theme.dark=!$vuetify.theme.dark"
  >
    <v-icon>mdi-theme-light-dark</v-icon>
  </v-btn>
    </template>
    <span>Switch light/dark</span>
  </v-tooltip>

</v-app-bar>
</template>

<script>
import { mapState, mapGetters, mapMutations } from 'vuex';

export default {
  name: 'AppBar',
  computed: {
    ...mapState([
      'drawer'
    ]),
    ...mapGetters([
      'isAt'
    ])
  },
  methods: {
    ...mapMutations([
      'toggleDrawer'
    ]),
  }
};
</script>
