import Vue from 'vue';
import Router from 'vue-router';

import Home from '@/views/Home';
import Tools from '@/views/Tools';
import Flow from '@/views/Flow';

import Examples from '@/views/Examples';
import Cases from '@/views/Cases';
import About from '@/views/About';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL || './',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/tools/:tool',
      name: 'tool',
      component: Tools,
    },
    {
      path: '/tools*',
      name: 'tools',
      component: Tools,
    },
    {
      path: '/flow*',
      name: 'flow',
      component: Flow,
    },
    {
      path: '/run*',
      name: 'run',
      component: () => import(/* webpackChunkName: "run" */ './views/Run.vue'),
    },
    {
      path: '/examples*',
      name: 'examples',
      component: Examples,
    },
    {
      path: '/cases*',
      name: 'cases',
      component: Cases,
    },
    {
      path: '/about*',
      name: 'about',
      component: About,
    },
    {
      path: '/doc*',
      name: 'doc',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "doc" */ './components/NotReady.vue'),
      props: {msg: 'godoc'},
    },
    {
      path: '*',
      name: '404',
      component: () =>
        import(/* webpackChunkName: "doc" */ './components/404.vue'),
    },
  ],
});
