<template>
  <div>
    <div class="graph box" v-html="graph"></div>
    <div class="content has-text-justified">
      <pre v-show="showCode"><code>{{dotData}}</code></pre>
    </div>
  </div>
</template>

<script>
import Viz from 'viz.js';
let viz = new Viz(require('viz.js/lite.render.js'));

export default {
  name: 'GraphViz',
  props: {
    dotData: String,
    showCode: Boolean,
  },
  data() {
    return {
      graph: String,
    };
  },
  mounted() {
    this.render(this.dotData);
  },
  watch: {
    dotData() {
      this.render(this.dotData);
    },
  },
  methods: {
    render(d) {
      if (!d) {
        d = 'digraph { "This graph is" -> "Empty!" }';
      }
      viz.renderString(d).then((g) => {
        this.graph = g;
      });
    },
  },
};
</script>

<style lang="scss">
.graph > svg {
  max-width: 100%;
  height: auto;
}
</style>
