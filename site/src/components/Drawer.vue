<template>
  <v-navigation-drawer
    v-model="$store.state.drawer"
    :mini-variant="drawerMini"
    :disable-route-watcher="true"
    app
    overlay-color="primary"
  >
    <v-list dense class="pt-0 pb-0">
      <!-- TODO:
      It feels that there is too much duplication. This should be refactored.
    -->

      <!-- CLOSE -->

      <v-tooltip right v-if="drawerMini">
        <template v-slot:activator="{on}">
          <v-list-item link v-on="on" @click="toggleDrawer">
            <v-list-item-action><v-icon>mdi-close</v-icon></v-list-item-action>
            <v-list-item-content></v-list-item-content>
          </v-list-item>
        </template>
        <span>{{ $t('closeMenu') }}</span>
      </v-tooltip>

      <v-list-item link v-if="!drawerMini" @click="toggleDrawer">
        <v-list-item-action><v-icon>mdi-close</v-icon></v-list-item-action>
        <v-list-item-content
          ><v-list-item-title>{{
            $t('closeMenu')
          }}</v-list-item-title></v-list-item-content
        >
      </v-list-item>

      <v-divider />

      <!-- SETTINGS -->

      <v-list-item link disabled>
        <v-list-item-action
          ><v-icon disabled>mdi-settings</v-icon></v-list-item-action
        >
        <v-list-item-content
          ><v-list-item-title>Settings</v-list-item-title></v-list-item-content
        >
      </v-list-item>

      <v-divider />

      <!-- EXPAND | COLLAPSE -->

      <v-tooltip right v-if="drawerMini">
        <template v-slot:activator="{on}">
          <v-list-item link v-on="on" @click="drawerMini = !drawerMini">
            <v-list-item-action
              ><v-icon>mdi-arrow-expand-right</v-icon></v-list-item-action
            >
            <v-list-item-content></v-list-item-content>
          </v-list-item>
        </template>
        <span>Expand</span>
      </v-tooltip>

      <v-list-item link v-if="!drawerMini" @click="drawerMini = !drawerMini">
        <v-list-item-action
          ><v-icon>mdi-arrow-collapse-left</v-icon></v-list-item-action
        >
        <v-list-item-content
          ><v-list-item-title>Collapse</v-list-item-title></v-list-item-content
        >
      </v-list-item>
    </v-list>

    <template v-slot:append v-if="!drawerMini">
      <v-alert
        type="warning"
        prominent
        class="ml-2 mr-2 caption text-center"
        dense
        outlined
      >
        This tool is a proof of concept; expect breaking changes!
      </v-alert>
    </template>
  </v-navigation-drawer>
</template>

<script>
import {mapMutations} from 'vuex';

export default {
  name: 'Drawer',
  data: () => ({
    // TODO: use localStorage to remember user preference with regard to having the drawer expanded/collapsed
    drawerMini: true,
  }),
  methods: {
    ...mapMutations(['toggleDrawer']),
  },
};
</script>
