<template>
  <div class="about container">
    <div class="section">
      <div class="box">
        <strong>DBHI</strong> by
        <a href="https://github.com/umarcor">Unai Martinez-Corral</a> and
        <a href="https://github.com/GuillermoCallaghan">Guillermo Callaghan</a>
      </div>
    </div>
    <ToDo />
  </div>
</template>

<script>
import ToDo from '@/components/ToDo.vue';

export default {
  name: 'about',
  components: {
    ToDo,
  },
};
</script>
