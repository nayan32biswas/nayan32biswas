<template>
  <div class="Blog">
    <h1>Resume</h1>
    <div>
      <pdf src="../assets/Nayan-Biswas-Resume.pdf"></pdf>
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from "vue-class-component";
import pdf from "vue-pdf";

@Options({
  components: {
    pdf,
  },
})
export default class Resume extends Vue {
  //   fileContent = mdFile;
}
</script>
<style lang="sass" scoped></style>
