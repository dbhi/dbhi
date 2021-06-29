<template>
  <div id="app">
    <NavBar />
    <div id="view" :class="{nothome: $router.currentRoute.name != 'home'}">
      <router-view />
    </div>
    <Foot v-if="$router.currentRoute.name != 'home'" />
  </div>
</template>

<script>
import '@mdi/font/css/materialdesignicons.css';

import Buefy from 'buefy';
import 'buefy/dist/buefy.css';

import Vue from 'vue';
Vue.use(Buefy);

const marked = require('marked');
Vue.mixin({
  // This is a workaround for GitHub Pages not serving routes without an index.html.
  // 404.html will be loaded, which will set `GoToPath` and the navigate to `/concept`,
  // where this site is expected to be hosted: dbhi.github.io/concept
  mounted: function () {
    let path = localStorage.getItem('GoToPath');
    if (path) {
      console.log('GoToPath:', path);
      localStorage.removeItem('GoToPath');
      let _path = path.split('/');
      if (_path[1] === 'concept') {
        this.$router.replace({path: _path.slice(2).join('/')});
      } else {
        window.location.href = '/';
      }
    }
  },
  methods: {
    marked: function (input) {
      if (input) {
        return marked(input);
      }
      return '';
    },
    tagColor(s) {
      switch (s) {
        case 'arm':
          return 'is-info';
        case 'amd64':
          return 'is-dark';
        case 'ghdl':
        case 'gcc':
        case 'dbm':
        case 'golang':
        case 'protoc':
          return 'is-light';
        default:
          return 'is-primary';
      }
    },
    stIcon(s) {
      switch (s) {
        case 'supported':
          return 'check';
        case 'roadmap':
          return 'map-marker-distance';
        case 'third-party':
          return 'bookmark';
        case 'out-of-scope':
          return 'map-marker-off';
        default:
          return 'help';
      }
    },
    stType(s) {
      switch (s) {
        case 'supported':
          return 'is-success';
        case 'roadmap':
          return 'is-warning';
        case 'third-party':
          return 'is-info';
        default:
          return 'is-danger';
      }
    },
  },
});

import NavBar from '@/components/NavBar.vue';
import Foot from '@/components/Foot.vue';

export default {
  name: 'app',
  components: {
    NavBar,
    Foot,
  },
  data() {
    return {
      shields: require('@/assets/json/shields.json'),
    };
  },
};
</script>

<style lang="scss">
@import '~bulma/sass/utilities/_all';

// Set your colors
$primary: #ec563c;
$primary-invert: findColorInvert($primary);
$twitter: #4099ff;
$twitter-invert: findColorInvert($twitter);
$navbar-item-color: #202a33;
$navbar-item-active-color: #ec563c;
$footer-background-color: transparent;
$footer-padding: 1rem 0rem;

// Setup $colors to use as bulma classes (e.g. 'is-twitter')
$colors: (
  'primary': (
    $primary,
    $primary-invert,
  ),
);

// Links
$link: $primary;
$link-invert: $primary-invert;
$link-focus-border: $primary;

// Import Bulma and Buefy styles
@import '~bulma';
@import '~buefy/src/scss/buefy';

@font-face {
  font-family: BigJohnPRORegular;
  src: url('assets/fonts/BigJohnPRO-Regular.otf');
}
@font-face {
  font-family: BigJohnPROLight;
  src: url('assets/fonts/BigJohnPRO-Light.otf');
}
@font-face {
  font-family: BigJohnPROBold;
  src: url('assets/fonts/BigJohnPRO-Bold.otf');
}
html,
body,
#app {
  height: 100%;
  max-height: 100%;
  background-color: #f2f1ef;
}
#view {
  flex-grow: 1;
}
#app {
  font-family: 'Fenix', 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #202a33;
  display: flex;
  flex-direction: column;
}
.nothome {
  padding-top: 56px;
}
hr {
  height: 1px;
  background-color: #ec563c;
  margin: 1rem 0;
}
</style>
