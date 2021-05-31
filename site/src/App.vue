<template>
<v-app>
  <Drawer/>
  <AppBar/>
  <v-main>
    <router-view/>
  </v-main>
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
