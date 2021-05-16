<template>
  <b-modal
    hide-header
    hide-footer
    centerd
    v-model="showModal"
    no-close-on-backdrop
  >
    <template>
      <b-form @submit.prevent="submitSearch()">
        <div class="search">
          <input
            v-model="search"
            type="search"
            name="search"
            v-on:keyup.38="upArrowPress()"
            v-on:keyup.40="downArrowPress()"
            placeholder="Type '?' to see top level options"
          />
        </div>
        <div class="results">
          <li
            class="result-item"
            v-for="(result, idx) in results"
            :key="'search-results' + idx"
          >
            <span class="result-name">{{ result.name }}</span>
          </li>
        </div>
      </b-form>
    </template>
  </b-modal>
</template>

<script lang="ts">
import { Component, Watch, Vue } from "vue-property-decorator";

import { Search as SearchType } from "@/types/common.types";

@Component({})
export default class Search extends Vue {
  showModal = true;
  search = "";
  results: Array<SearchType> = [
    {
      name: "Blog Page",
      link: "/blog",
    },
    {
      name: "Skill Page",
      link: {
        name: "skill",
      },
    },
  ];
  upArrowPress(): void {
    console.log("up press");
  }
  downArrowPress(): void {
    console.log("down press");
  }
  @Watch("showModal")
  handleModalClose(): void {
    this.$emit("modalClose");
  }

  @Watch("search")
  handleSearch(): void {
    console.log("handleSearch: ", this.search);
  }

  submitSearch(result: SearchType | null = null): void {
    console.log("submitSearch: ", result);
    if (!result) {
      if (this.results.length) {
        result = this.results[0];
      }
    }
    if (result) {
      console.log("search able");
    }
  }
}
</script>

<style scoped lang="scss">
::v-deep .modal-content {
  margin-top: 8rem;

  .modal-body {
    background-color: #292949;
    padding: 0;

    .results {
      background-color: #1b2d33;
      color: white;
      font-weight: 400;
      :hover {
        background-color: #2b4048;
      }
      .result-item {
        display: flex;
        cursor: pointer;

        border-bottom: 1px solid #2a3e44;
        .result-name {
          margin: 8px 15px;
        }
      }
    }
  }
}

.search {
  padding: 16px 24px;
  width: 100%;
  height: 100%;
  input {
    color: #fcfcfc;
    width: 100%;
    border: none;
    outline: 0;
    padding: 0;
    font-size: 24px;
    background: transparent;
    line-height: 1.33;
  }
}
</style>
