<template>
  <div class="examples container">
    <section class="section">
      <h1 class="title">
        Working examples
      </h1>
    </section>
    <div class="tabs is-centered">
      <ul>
        <li
          v-for="(v, k) in examples"
          :key="k"
          :class="{ 'is-active': k == active }"
        >
          <a @click="active = k">{{ k }}</a>
        </li>
      </ul>
    </div>
    <div class="content has-text-justified">
      <div class="box">
        <ul class="no-list-style">
          <TreeView
            class="tree"
            v-for="(child, index) in examples[active].tree"
            :key="index"
            :name="index"
            :tree="child"></TreeView>
        </ul>
      </div>
      <div
        v-html="marked(examples[active].content)"
      ></div>
    </div>
  </div>
</template>

<script>
var examples = {
  demo: {
    path: "demo",
    content: require("@/../egs/demo.md").default.content,
  },
  axisbuffer: {
    path: "axisbuffer",
    content: require("@/../egs/axisbuffer.md").default.content,
  },
  hsconv2: {
    path: "hsconv2",
    content: require("@/../egs/hsconv2.md").default.content,
  },
  riscv: {
    path: "riscv"
  }
};

const d = require("@/assets/json/examples.json");

var f = function f(s, d, t, k) {
  var i = s[0]
  if (!t.tree[i]) {
    t.tree[i] = {
      'desc': '',
      'tree': {}
    };
  }
  if (s.length > 1) {
    s.shift();
    t.tree[i] = f(s, d, t.tree[i], k+1);
  } else {
    t.tree[i].desc = d;
  }
  return t;
};

var descs = {};
for (var k in d) {
    if (d.hasOwnProperty(k)) {
      var s = k.split('/')
      if (s[s.length-1]==='') {
        s[s.length-2] = s[s.length-2]+'/';
        s.pop();
      }
      var i = s[0]
      if (examples[i]) {
        if (!examples[i].tree) {
          examples[i].tree = {};
        }
        s.shift();
        examples[i] = f(s, d[k], examples[i], 0);
      }
    }
};

import TreeView from "@/components/TreeView.vue";

export default {
  name: "examples",
  components: {
  	TreeView,
  },
  data() {
    return {
      examples: examples,
      active: "axisbuffer"
    };
  }
};
</script>

<style lang="scss">
.no-list-style {
  list-style: none!important;
}
</style>