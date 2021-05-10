<template>
  <div class="Blog">
    <div>
      <VueShowdown :markdown="getContent"></VueShowdown>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

@Component({
  components: {},
  name: "BlogDetails",
})
export default class BlogDetails extends Vue {
  get getContent(): string {
    return require("!!html-loader!markdown-loader!../assets/md_files/docker.md");
  }
}
</script>
<style lang="sass" scoped></style>
