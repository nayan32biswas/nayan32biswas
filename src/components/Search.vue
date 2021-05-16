<template>
  <b-modal hide-header hide-footer centerd v-model="showModal">
    <template>
      <b-form @submit.prevent="submitSearch()">
        <div class="search">
          <b-form-input
            v-model="input"
            type="search"
            name="Search"
            debounce="300"
            v-on:keyup.38="changeSelected(-1)"
            v-on:keyup.40="changeSelected(1)"
            placeholder="Search..."
          />
          <!-- v-on:keyup.38=="upArrow" and v-on:keyup.40=="downArrow" -->
        </div>
        <span class="search-message">CRTL + SHIFT + F</span>
        <div class="results">
          <li
            class="result-item"
            v-for="(result, idx) in results"
            :key="'search-results' + idx"
            @click.prevent="submitSearch(idx)"
            :class="{ 'selected-result': selectedResult === idx }"
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
import search from "../store/search";

@Component({})
export default class Search extends Vue {
  showModal = true;
  input = "";
  selectedResult = 0;
  results: Array<SearchType> = [];

  pages: Array<SearchType> = [
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
    {
      name: "Contact Page",
      link: {
        name: "contact",
      },
    },
  ];

  changeSelected(change: number): void {
    if (!change) {
      this.selectedResult = 0;
      return;
    }
    this.selectedResult += change;
    if (this.selectedResult < 0) {
      this.selectedResult = this.results.length - 1;
      return;
    }
    this.selectedResult = this.selectedResult % this.results.length;
  }
  @Watch("showModal")
  handleModalClose(): void {
    this.$emit("modalClose");
  }

  @Watch("input")
  handleSearch(): void {
    if (this.input.length < 2) {
      this.results = [];
      return;
    }
    this.changeSelected(0);
    this.results = search(this.input);
  }

  submitSearch(idx: number | null = null): void {
    const pos = idx || this.selectedResult;
    if (this.results.length < pos) {
      return;
    }
    const result = this.results[pos];
    this.$emit("modalClose");
    this.$router.push(result.link);
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

        border-bottom: 2px solid #2a3e44;
        .result-name {
          margin: 8px 15px;
        }
      }
    }
    .search-message {
      color: #fcfcfc;
      margin: 3px 5px 0 0;
      font-size: 10px;
      font-weight: 200;
      top: 0;
      right: 0;
      position: absolute;
    }
    .selected-result {
      background-color: #2b4048;
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
