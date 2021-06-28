<template>
  <div class="tools container">
    <section class="section">
      <h1 class="title">
        Third-party tools
      </h1>
      <div class="content has-text-justified">{{ intro }}</div>
    </section>
    <div class="tile is-ancestor">
      <div class="tile is-parent is-vertical" v-for="(c, i) in cols" :key="i">
        <article class="tile is-child" v-for="(v, k) in c" :key="k">
          <div class="box">
            <!-- Main container -->
            <div class="level">
              <!-- Left side -->
              <div class="level-left">
                <div class="level-item is-grouped" @click="toggle(i, k)">
                  <a class="control">
                    <b-icon
                      :icon="'chevron-' + (show[i][k] ? 'down' : 'right')"
                      :custom-class="show[i][k] ? 'is-expanded' : ''"
                    >
                    </b-icon>
                  </a>
                  <a class="control">
                    <span class="title is-4">{{ v.tool }}</span>
                  </a>
                </div>
              </div>
              <!-- Right side -->
              <div class="level-right is-grouped">
                <div class="control">
                  <a :href="'https://github.com/' + v.gh" v-if="v.gh">
                    <b-icon icon="github-circle" custom-size="mdi-24px">
                    </b-icon>
                  </a>
                  <p v-if="!v.gh" style="opacity: 0.5;">
                    <b-icon icon="github-circle" custom-size="mdi-24px">
                    </b-icon>
                  </p>
                </div>

                <div class="control">
                  <a
                    :href="'https://en.wikipedia.org/wiki/' + v.wikipedia"
                    v-if="v.wikipedia"
                  >
                    <b-icon icon="wikipedia" custom-size="mdi-24px"> </b-icon>
                  </a>
                  <p v-if="!v.wikipedia" style="opacity: 0.5;">
                    <b-icon icon="wikipedia" custom-size="mdi-24px"> </b-icon>
                  </p>
                </div>
                <div class="control">
                  <a :href="v.site" v-if="v.site">
                    <b-icon icon="web" custom-size="mdi-24px"></b-icon>
                  </a>
                  <p :href="v.site" v-if="!v.site" style="opacity: 0.5;">
                    <b-icon icon="web" custom-size="mdi-24px"></b-icon>
                  </p>
                </div>
              </div>
            </div>
            <div v-show="show[i][k]">
              <hr />
              {{ v.desc }}
            </div>
          </div>
        </article>
      </div>
    </div>

    <div
      class="section content has-text-justified"
      v-html="marked(content)"
    ></div>
  </div>
</template>

<script>
var tools = {};
var cols = { left: {}, right: {} };
var show = { left: {}, right: {} };

[
  "ghdl",
  "vunit",
  "mambo",
  "dynamorio",
  "gcc",
  "spinalhdl",
  "golang",
  "protoc",
  "gtkwave",
  "docker"
].forEach(function(e) {
  var d = require("@/assets/md/tools/" + e + ".md").default;
  tools[e] = d.data;
  tools[e].desc = d.content;
  tools[e].show = false;
});

var keys = Object.keys(tools);
for (var i = 0; i < keys.length; i++) {
  var c = i < Math.round(keys.length / 2) ? "left" : "right";
  cols[c][keys[i]] = tools[keys[i]];
  show[c][keys[i]] = false;
}

const d = require("@/assets/md/tools/tools.md").default;

export default {
  name: "tools",
  data() {
    return {
      cols: cols,
      show: show,
      intro: d.data.intro,
      content: d.content
    };
  },
  methods: {
    toggle(i, k) {
      this.show[i][k] = !this.show[i][k];
      localStorage.setItem("tools-show", JSON.stringify(this.show));
    }
  },
  mounted: function() {
    try {
      var s = JSON.parse(localStorage.getItem("tools-show"));
      if (s != null) {
        this.show = s;
      }
    } catch (e) {
      localStorage.removeItem("tools-show");
    }

    var t = this.$route.params.tool;
    if (this.cols.left[t] != undefined) {
      this.show.left[t] = true;
    }
    if (this.cols.right[t] != undefined) {
      this.show.right[t] = true;
    }
  }
};
</script>

<style lang="scss" scoped>
.level {
  margin-bottom: 0 !important;
}
</style>
