<template>
<v-footer
  app
  v-if="!isAt('home') && !isAt('about')"
>
  <template>
    Dynamic Binary Hardware Injection
  </template>
  <v-spacer></v-spacer>
</v-footer>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: 'Foot',
  computed: {
    ...mapGetters([
      'isAt'
    ])
  },
};
</script>
