<template>
  <HomeBodyTop />
</template>

<script lang="ts">
import { Options, Vue } from "vue-class-component";

import HomeBodyTop from "../components/home/HomeBodyTop.vue";

@Options({
  components: {
    HomeBodyTop,
  },
})
export default class Home extends Vue {}
</script>
<style lang="sass" scoped></style>
