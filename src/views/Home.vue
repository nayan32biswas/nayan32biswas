<template>
  <HomeBodyTop />
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

import HomeBodyTop from "../components/home/HomeBodyTop.vue";

@Component({
  components: {
    HomeBodyTop,
  },
})
export default class Home extends Vue {}
</script>
<style lang="scss" scoped></style>
