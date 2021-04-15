<template>
  <div class="Blog">
    <h1>BlogDetails</h1>
    <!-- <div><VueShowdown :markdown="getContent()"></VueShowdown></div> -->
  </div>
</template>

<script lang="ts">
import { Options, Vue } from "vue-class-component";

import VueShowdown from "vue-showdown";

// import mdFile from "../../README.md";

@Options({
  components: {
    VueShowdown,
  },
})
export default class BlogDetails extends Vue {
  //   fileContent = mdFile;
}
</script>
<style lang="sass" scoped></style>
