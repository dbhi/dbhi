<template>
  <nav
    class="navbar is-fixed-top is-transparent"
    role="navigation"
    aria-label="main navigation"
  >
    <div class="container">
      <div class="navbar-brand">
        <router-link
          class="navbar-item"
          to="/"
          style="padding-top: 0; padding-bottom: 0"
        >
          <b-icon
            icon="source-fork"
            size="is-medium"
            custom-size="mdi-24px"
            style="padding-bottom: 2px"
          ></b-icon>
          <span style="font-size: 2rem; font-family: BigJohnPROBold">DBHI</span>
        </router-link>

        <a
          role="button"
          class="navbar-burger burger"
          aria-label="menu"
          aria-expanded="false"
          data-target="navbarBasicExample"
        >
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
          <router-link
            class="navbar-item"
            v-for="r in menu.left"
            :key="r.link"
            :to="r.link"
            active-class="is-active"
            >{{ r.name }}</router-link
          >
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <router-link
              class="navbar-item"
              v-for="r in menu.right"
              :key="r.link"
              :to="r.link"
              active-class="is-active"
              >{{ r.name }}</router-link
            >
            <!--
            <div class="buttons">
              <a class="button is-primary">
                <strong>Sign up</strong>
              </a>
              <a class="button is-light">
                Log in
              </a>
            </div>
-->
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'navbar',
  data() {
    return {
      menu: require('@/assets/json/menu.json'),
    };
  },
};
</script>

<style lang="scss" scoped>
.navbar-menu > div > a.navbar-item.is-active {
  font-family: BigJohnPROBold;
}
.navbar {
  font-family: BigJohnPRORegular;
  font-weight: bold;
  background: transparent !important;
}
.navbar:hover {
  background: rgba(242, 241, 239, 0.75) !important;
  border-bottom: 1px solid #ec563c;
}
</style>
