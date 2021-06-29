<template>
  <li>
    <div :class="{isfolder: isFolder}" @click="toggle">
      <b-taglist attached>
        <b-tag v-if="isFolder" size="is-small"
          ><b-icon
            v-if="isFolder"
            :icon="'chevron-' + (isOpen ? 'down' : 'right')"
            type="is-primary"
        /></b-tag>
        <b-tag size="is-small">{{ name }}{{ isFolder ? '/' : '' }}</b-tag>
        <span style="margin-bottom: 0.5rem; padding-left: 1rem">{{
          tree.desc
        }}</span>
      </b-taglist>
    </div>
    <ul v-show="isOpen" v-if="isFolder" class="no-list-style">
      <treeview
        class="tree"
        v-for="(child, index) in tree.tree"
        :key="index"
        :name="index"
        :tree="child"
      ></treeview>
    </ul>
  </li>
</template>

<script>
export default {
  name: 'treeview',
  props: {
    name: String,
    tree: Object,
  },
  data: function () {
    return {
      isOpen: true,
    };
  },
  computed: {
    isFolder: function () {
      return this.tree.tree && Object.keys(this.tree.tree).length;
    },
  },
  methods: {
    toggle: function () {
      if (this.isFolder) {
        this.isOpen = !this.isOpen;
      }
    },
  },
};
</script>

<style lang="scss">
.isfolder {
  cursor: pointer;
}
</style>
