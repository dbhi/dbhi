import Vue from 'vue';
import { sync } from 'vuex-router-sync';
import Vuetify from 'vuetify/lib';

import App from './App.vue';
import router from '@/router';
import store from '@/store';

import VueI18n from 'vue-i18n';
import i18n_en from '@/locales/en.json'

Vue.use(Vuetify);
Vue.use(VueI18n);

const messages = {
  en: i18n_en,
}

const i18n = new VueI18n({
  locale: 'en',
  messages,
})

const vuetify = new Vuetify({
  theme: {
    themes: {
      light: {
        primary: '#EC563C',
      },
      dark: {
        primary: '#EC563C',
      },
    },
  },
});

sync(store, router);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  i18n,
   render: h => h(App)
}).$mount('#app')
