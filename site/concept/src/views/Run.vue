<template>
  <div class="run container">
    <section class="section">
      <h1 class="title">Task execution dependecies</h1>
      <div class="content has-text-justified" v-html="marked(content)" />
    </section>
    <div class="field is-grouped">
      <div class="field has-addons is-expanded" style="margin-bottom: 0">
        <div class="control">
          <b-select placeholder="Select a graph" v-model="active">
            <option v-for="(v, k) in graphs" :key="k" :value="k">
              {{ k }}
            </option>
          </b-select>
        </div>
        <div class="control is-expanded">
          <a
            class="button is-static"
            style="width: 100%; justify-content: left"
          >
            {{ descs[active] }}
          </a>
        </div>
      </div>
      <b-switch v-model="showCode">
        {{ showCode ? 'Hide' : 'Show' }} code
      </b-switch>
    </div>

    <GraphViz :dotData="graphs[active]" :showCode="showCode" />
  </div>
</template>

<script>
import GraphViz from '@/components/GraphViz';

var graphs = {};
require
  .context('@/assets/dot/', false, /\.dot$/)
  .keys()
  .forEach(function (f) {
    var id = f.substring(2);
    var d = require('raw-loader!@/assets/dot/' + id).default;
    graphs[id.slice(0, -4)] = d;
  });

const c = require('@/assets/md/run/run.md').default;

var descs = {};
for (var k in c.data) {
  if (c.data.hasOwnProperty(k)) {
    if (!graphs[k]) {
      console.log(
        'Key <' + k + '> not found in graphs list; skipping description.'
      );
    } else {
      descs[k] = c.data[k];
    }
  }
}

export default {
  name: 'run',
  components: {
    GraphViz,
  },
  data() {
    return {
      graphs: graphs,
      descs: descs,
      active: 'full',
      content: c.content,
      showCode: false,
    };
  },
};
</script>
