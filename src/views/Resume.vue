<template>
  <div class="Blog">
    <h1>Resume</h1>
    <div>
      <!-- src="https://pdftron.s3.amazonaws.com/downloads/pl/webviewer-demo.pdf" -->
      <!-- <pdf
        src="https://pdftron.s3.amazonaws.com/downloads/pl/webviewer-demo.pdf"
        :page="currentPage"
        @num-pages="pageCount = $event"
        @page-loaded="currentPage = $event"
      ></pdf> -->
      <!-- <iframe :src="resume" height="500" width="100%"></iframe> -->
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import pdf from "vue-pdf";

@Component({
  components: {
    pdf,
  },
})
export default class Resume extends Vue {
  //   fileContent = mdFile;
  pageCount = 0;
  currentPage = 1;

  resume = "@/assets/pdf/sample.pdf";
  // resume = "https://pdftron.s3.amazonaws.com/downloads/pl/webviewer-demo.pdf";
}
</script>
<style lang="scss" scoped></style>
