<template>
  <div class="Blog">
    <h1>Resume</h1>
    <div>
      <pdf src="../assets/Nayan-Biswas-Resume.pdf"></pdf>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
// import pdf from "vue-pdf";

@Component({
  components: {
    // pdf,
  },
})
export default class Resume extends Vue {
  //   fileContent = mdFile;
}
</script>
<style lang="sass" scoped></style>
