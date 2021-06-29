<template>
  <div>
    <div class="tile is-ancestor has-text-justified">
      <div class="tile is-parent is-vertical">
        <div>
          <div class="content">
            <span class="is-size-4 has-text-primary">Status</span>
          </div>
          <div
            class="field"
            v-for="(i, c) in d.status.items"
            :key="c"
            :class="{'is-disabled': !value.status[c[0]]}"
          >
            <b-checkbox
              v-model="value.status[c[0]]"
              :class="{'has-text-weight-bold': value.status[c[0]]}"
              ><b-icon :icon="stIcon(c)" :type="stType(c)"></b-icon>
            </b-checkbox>
            <p class="is-size-7 is-italic has-text-weight-light">{{ i }}</p>
          </div>
        </div>
        <hr />
        <div>
          <div class="content">
            <span class="is-size-4 has-text-primary">Source</span>
            <p>{{ d.src.desc }}</p>
          </div>
          <div
            class="field"
            v-for="(i, c) in d.src.items"
            :key="c"
            :class="{'is-disabled': !value.src[c[0]]}"
          >
            <b-checkbox
              v-model="value.src[c[0]]"
              :class="{'has-text-weight-bold': value.src[c[0]]}"
              >{{ c }}</b-checkbox
            >
            <p class="is-size-7 is-italic has-text-weight-light">{{ i }}</p>
          </div>
        </div>
      </div>

      <div class="tile is-parent is-vertical">
        <div>
          <div class="content">
            <span class="is-size-4 has-text-primary">Software</span>
            <p>{{ d.soft.desc }}</p>
          </div>
          <div
            class="field"
            v-for="(i, c) in d.soft.items"
            :key="c"
            :class="{'is-disabled': !value.soft[c[0]]}"
          >
            <b-checkbox
              v-model="value.soft[c[0]]"
              :class="{'has-text-weight-bold': value.soft[c[0]]}"
              >{{ c }}</b-checkbox
            >
            <p class="is-size-7 is-italic has-text-weight-light">{{ i }}</p>
          </div>
        </div>
        <hr />
        <div>
          <div class="content">
            <span class="is-size-4 has-text-primary">Hardware</span>
            <p>{{ d.hard.desc }}</p>
          </div>
          <div
            class="field"
            v-for="(i, c) in d.hard.items"
            :key="c"
            :class="{'is-disabled': !value.hard[c[0]]}"
          >
            <b-checkbox
              v-model="value.hard[c[0]]"
              :class="{'has-text-weight-bold': value.hard[c[0]]}"
              >{{ c }}</b-checkbox
            >
            <p class="is-size-7 is-italic has-text-weight-light">{{ i }}</p>
          </div>
        </div>
      </div>

      <div class="tile is-parent is-vertical">
        <div class="content">
          <span class="is-size-4 has-text-primary">Artifacts</span>
        </div>
        <div class="field" v-for="(i, c) in d.artifacts.items" :key="c">
          <div class="is-grouped">
            <b-icon
              type="is-primary"
              icon="checkbox-intermediate"
              style="vertical-align: bottom"
            ></b-icon>
            <span
              class="control-label has-text-weight-bold"
              style="padding-left: 0.5rem"
              >{{ c }}</span
            >
          </div>

          <p
            class="is-size-7 is-italic has-text-weight-light"
            style="padding-top: 0.2rem"
          >
            {{ i }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'casestablekey',
  props: {value: Object},
  data() {
    return {
      d: require('@/assets/json/tabkeys.json'),
    };
  },
};
</script>

<style lang="scss">
.is-disabled {
  opacity: 0.75;
}
</style>
