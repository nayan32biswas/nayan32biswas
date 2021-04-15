<template>
  <NavBar />
  <router-view />
</template>

<script lang="ts">
import { Options, Vue } from "vue-class-component";
import NavBar from "./components/NavBar.vue";

@Options({
  props: {
    msg: String,
  },
  components: {
    NavBar,
  },
})
export default class App extends Vue {
  msg!: string;
}
</script>

<style lang="scss">
@import "./assets/style/main.scss";
</style>
