<template>
  <div class="about container">
    <div class="tabs is-centered">
      <ul>
        <li
          v-for="(v, k) in todos"
          :key="(v, k)"
          :class="{'is-active': k == active}"
        >
          <a @click="active = k">{{ k }}</a>
        </li>
      </ul>
    </div>
    <div
      class="content has-text-justified"
      v-html="marked(todos[active])"
    ></div>
  </div>
</template>

<script>
var todos = {};

['Contributions', 'ToDo', 'Site', 'CLI'].forEach(function (e) {
  var d = require('@/assets/md/todo/' + e + '.md').default;
  todos[e] = d.content;
});

export default {
  name: 'todo',
  data() {
    return {
      todos: todos,
      active: 'Contributions',
    };
  },
};
</script>
