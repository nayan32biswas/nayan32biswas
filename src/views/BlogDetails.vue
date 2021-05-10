<template>
  <div class="Blog">
    <h1>BlogDetails</h1>
    <!-- <div><VueShowdown :markdown="getContent()"></VueShowdown></div> -->
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

// import VueShowdown from "vue-showdown";

// import mdFile from "../../README.md";

@Component({
  components: {
    // VueShowdown,
  },
})
export default class BlogDetails extends Vue {
  //   fileContent = mdFile;
}
</script>
<style lang="sass" scoped></style>
