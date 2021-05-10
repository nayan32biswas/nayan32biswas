<template>
  <div class="Blog">
    <h1>Blog Index</h1>
    <router-link
      :to="{ name: 'BlogDetails', params: { filename: 'demo-file' } }"
      >Blog detaiils</router-link
    >
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component({})
export default class BlogIndex extends Vue {
  //   fileContent = mdFile;
}
</script>
<style lang="sass" scoped></style>
