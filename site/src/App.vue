<template>
<v-app>
  <Drawer/>
  <AppBar/>
  <v-content>
    <router-view/>
  </v-content>
  <Foot/>
</v-app>
</template>

<script>
import Drawer from '@/components/Drawer';
import AppBar from '@/components/AppBar';
import Foot from '@/components/Foot';

export default {
  name: 'App',
  components: {
    Drawer,
    AppBar,
    Foot
  },
  created () {
    this.$vuetify.theme.dark = false;
  }
};
</script>
