<template>
  <div class="cases container">
    <section class="section">
      <h1 class="title">
        Enumeration of multiple use cases to co-execute software and hardware
      </h1>
      <div class="content has-text-justified">{{ intro }}</div>
    </section>

    <CasesTable
      :data="activeData"
      :selected.sync="tabsel"
      :showKey.sync="showKey"
      :total="total"
    />

    <hr />
    <CasesTableKey class="box" v-show="showKey" v-model="keys" />

    <div class="box has-text-justified" v-show="'content' in tabsel">
      <div
        class="content"
        v-html="
          marked('content' in tabsel ? tabsel.content : 'empty content field')
        "
      ></div>
    </div>

    <div class="content has-text-justified" v-html="marked(content)"></div>
  </div>
</template>

<script>
var d = {
  soft: ['arm', 'amd64', 'user', 'system'],
  srcs: ['yes', 'no'],
  hard: ['arm', 'amd64', 'pl'],
  status: ['supported', 'roadmap', 'third-party', 'out-of-scope', 'unknown'],
};

var data = {};

for (var x = 0; x < d['soft'].length; x++) {
  for (var y = 0; y < d['srcs'].length; y++) {
    for (var z = 0; z < d['hard'].length; z++) {
      var s = d['soft'][x];
      var r = d['srcs'][y] === 'yes';
      var h = d['hard'][z];

      var id =
        (r ? 'y' : 'n') +
        (s === 'amd64' ? 'x' : s[0]) +
        (h === 'amd64' ? 'x' : h[0]);

      data[id] = {
        soft: s,
        src: r,
        hard: h,
        status: 'unknown',
        artifacts: '',
        content: 'No available info for this use case.',
      };
    }
  }
}

import CasesTable from '@/components/CasesTable.vue';
import CasesTableKey from '@/components/CasesTableKey.vue';

require
  .context('@/assets/md/cases/', false, /\.md$/)
  .keys()
  .forEach(function (f) {
    var d = require('@/assets/md/cases/' + f.substring(2)).default;
    var id = d.data.id;
    if (id != undefined) {
      if (data[id] == undefined) {
        console.log(
          'WARNING: case <' +
            id +
            '> from file <' +
            f.substring(2) +
            '> is undefined!'
        );
      } else {
        data[id].status = d.data.status;
        data[id].artifacts = d.data.artifacts;
        data[id].content = d.content;
        data[id].dependencies = d.data.dependencies;
      }
    }
  });

var tabdata = [];
for (var k in data) {
  if (data.hasOwnProperty(k)) {
    var o = data[k];
    o['id'] = k;
    tabdata.push(o);
  }
}

const zkeys = {
  status: {
    s: true,
    r: true,
    t: true,
    o: true,
    u: true,
  },
  src: {
    y: true,
    n: true,
  },
  soft: {
    a: true,
    x: true,
    u: true,
    s: true,
  },
  hard: {
    a: true,
    x: true,
    p: true,
  },
};

const c = require('@/assets/md/cases/cases.md').default;

export default {
  name: 'cases',
  components: {
    CasesTable,
    CasesTableKey,
  },
  data() {
    return {
      intro: c.data.intro,
      content: c.content,
      total: tabdata.length,
      tabsel: {},
      showKey: false,
      keys: this.initKeys(),
    };
  },
  computed: {
    activeData: function () {
      var a = [];
      if (tabdata.length != 0) {
        var ks = this.keys;
        tabdata.forEach(function (f) {
          if (
            ks.status[f.status[0]] &&
            ks.src[f.id[0]] &&
            ks.soft[f.id[1]] &&
            ks.hard[f.id[2]]
          ) {
            a.push(f);
          }
        });
      }
      return a;
    },
  },
  methods: {
    initKeys() {
      try {
        var k = JSON.parse(localStorage.getItem('cases-keys'));
        if (k != null) {
          return k;
        }
      } catch (e) {
        localStorage.removeItem('cases-keys');
      }
      return zkeys;
    },
  },
  watch: {
    activeData() {
      localStorage.setItem('cases-keys', JSON.stringify(this.keys));
    },
  },
};
</script>
