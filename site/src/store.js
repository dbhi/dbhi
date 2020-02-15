import Vue from 'vue'
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({

  // https://vuex.vuejs.org/guide/strict.html
  strict: process.env.NODE_ENV !== 'production',

  // https://vuex.vuejs.org/guide/state.html
  state: {
    drawer: false,
  },

  // https://vuex.vuejs.org/guide/getters.html
  getters: {

    isAt: (state) => (name) => {
      return state.route.name === name
    },

  },

  // https://vuex.vuejs.org/guide/mutations.html
  mutations: {

    toggleDrawer (state) {
      state.drawer = !state.drawer;
    },

  },

  // https://vuex.vuejs.org/guide/actions.html
  actions: {

  }

});
