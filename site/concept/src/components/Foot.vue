<template>
  <footer class="footer">
    <div class="buttons is-centered">
      <a
        class="tag"
        v-for="s in shields"
        :key="s.ref + s.title"
        :title="s.title"
        :href="s.ref"
        ><img :src="s.src"
      /></a>
    </div>
  </footer>
</template>

<script>
export default {
  name: "foot",
  data() {
    return {
      shields: require("@/assets/json/shields.json")
    };
  }
};
</script>

<style lang="scss" scoped>
.footer {
  margin-top: 3rem;
  border-top: 1px solid #ec563c;
}
</style>
