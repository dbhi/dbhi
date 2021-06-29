<template>
  <div
    class="notready"
    style="
      height: 100%;
      max-height: 100%;
      display: flex;
      flex-direction: column;
    "
  >
    <div style="flex-grow: 1"></div>
    <div style="flex-grow: 0">
      <p class="title">Page not ready yet</p>
      <p>{{ msg }}</p>
    </div>
    <div style="flex-grow: 1"></div>
  </div>
</template>

<script>
export default {
  name: 'notready',
  props: {
    msg: String,
  },
};
</script>
