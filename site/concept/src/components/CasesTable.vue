<template>
  <section>
    <b-table
      :data="data"
      :selected="selected"
      :paginated="true"
      :per-page="perPage"
      :pagination-simple="false"
      paginationSize="is-small"
      :bordered="false"
      :striped="true"
      :narrowed="true"
      :hoverable="true"
      :loading="false"
      :focusable="true"
      :mobile-cards="true"
      @update:selected="$emit('update:selected', $event)"
      :default-sort-direction="'asc'"
      default-sort="status"
      @click="clicked"
    >
      <template slot-scope="props">
        <b-table-column
          field="status"
          label="Status"
          width="40"
          centered
          sortable
        >
          <b-icon
            :icon="stIcon(props.row.status)"
            :type="stType(props.row.status)"
          ></b-icon>
        </b-table-column>
        <b-table-column field="id" label="ID" width="40" centered>
          {{ props.row.id }}
        </b-table-column>

        <b-table-column field="src" label="Source" width="40" sortable>
          <span
            class="tag"
            :class="props.row.src ? 'is-success' : 'is-warning'"
          >
            {{ props.row.src ? "y" : "n" }}
          </span>
        </b-table-column>

        <b-table-column field="soft" label="Software" sortable>
          {{ props.row.soft }}
        </b-table-column>

        <b-table-column field="hard" label="Hardware" sortable>
          {{ props.row.hard }}
        </b-table-column>

        <b-table-column field="artifacts" label="Artifacts">
          <b-field grouped group-multiline>
            <div class="control" v-for="a in props.row.artifacts" :key="a">
              <b-taglist attached>
                <b-tag
                  size="is-small"
                  v-for="i in a.split(':')"
                  :key="a + i"
                  :type="tagColor(i)"
                  >{{ i }}</b-tag
                >
              </b-taglist>
            </div>
          </b-field>
        </b-table-column>

        <b-table-column field="dependencies" label="Dependencies">
          <b-taglist>
            <b-tag
              size="is-small"
              v-for="d in props.row.dependencies"
              :key="d"
              :type="tagColor(d)"
              >{{ d }}</b-tag
            >
          </b-taglist>
        </b-table-column>
      </template>

      <template slot="bottom-left">
        <div class="field is-grouped">
          <div class="control">
            <b-switch
              :native-value="showKey"
              @input="$emit('update:showKey', $event)"
              size="is-small"
              style="vertical-align: middle;"
              >Key</b-switch
            >
          </div>
          <div class="control">
            <div class="button is-static is-small">
              {{ data.length }} / {{ total }}
            </div>
          </div>
          <div class="field has-addons">
            <div class="control">
              <div class="select is-small">
                <select v-model="perPage">
                  <option v-for="v in [5, 10, 15, 30]" :key="v" :value="v">{{
                    v
                  }}</option>
                </select>
              </div>
            </div>
            <div class="control">
              <div class="button is-static is-small">per page</div>
            </div>
          </div>
        </div>
      </template>

      <template slot="empty">
        <section class="section">
          <div class="content has-text-grey has-text-centered">
            <p>
              <b-icon icon="emoticon-sad" size="is-large"> </b-icon>
            </p>
            <p>Nothing here.</p>
          </div>
        </section>
      </template>
    </b-table>
  </section>
</template>

<script>
export default {
  name: "casestable",
  props: {
    data: Array,
    selected: Object,
    showKey: Boolean,
    total: Number
  },
  data() {
    return {
      perPage: 30,
      hasMobileCards: true
    };
  },
  methods: {
    clicked(e) {
      if (e === this.selected) {
        this.$emit("update:selected", {});
      }
    }
  }
};

//You can have detailed rows by adding a detail named scoped slot and the detailed prop.
//By adding a scoped slot named header you can customize the headers. Use the meta prop on column to pass anything you may need.
</script>

<style lang="scss">
.table-wrapper:not(:last-child) {
  margin-bottom: 1rem;
}
</style>
