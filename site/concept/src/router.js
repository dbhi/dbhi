import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home.vue";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "home",
      component: Home
    },
    {
      path: "/tools/:tool",
      name: "tool",
      component: () =>
        import(/* webpackChunkName: "tools" */ "./views/Tools.vue")
    },
    {
      path: "/tools*",
      name: "tools",
      component: () =>
        import(/* webpackChunkName: "tools" */ "./views/Tools.vue")
    },
    {
      path: "/flow*",
      name: "flow",
      component: () => import(/* webpackChunkName: "flow" */ "./views/Flow.vue")
    },
    {
      path: "/run*",
      name: "run",
      component: () => import(/* webpackChunkName: "run" */ "./views/Run.vue")
    },
    {
      path: "/examples*",
      name: "examples",
      component: () =>
        import(/* webpackChunkName: "examples" */ "./views/Examples.vue")
    },
    {
      path: "/cases*",
      name: "cases",
      component: () =>
        import(/* webpackChunkName: "cases" */ "./views/Cases.vue")
    },
    {
      path: "/doc*",
      name: "doc",
      component: () =>
        import(/* webpackChunkName: "doc" */ "./components/NotReady.vue"),
      props: { msg: "godoc" }
    },
    {
      path: "/about*",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "about" */ "./views/About.vue")
    },
    {
      path: "*",
      name: "404",
      component: () =>
        import(/* webpackChunkName: "doc" */ "./components/404.vue")
    }
  ]
});
