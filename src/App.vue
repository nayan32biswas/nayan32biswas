<template>
  <div id="app">
    <NavBar />
    <router-view />
  </div>
</template>
<script lang="ts">
import { Component, Vue, Prop } from "vue-property-decorator";
import NavBar from "./components/NavBar.vue";

@Component({
  components: {
    NavBar,
  },
})
export default class Home extends Vue {
  @Prop() msg!: string;
}
</script>

<style lang="scss">
@import "./assets/style/main.scss";
@import "../node_modules/bootstrap/scss/bootstrap.scss";
@import "../node_modules/bootstrap-vue/dist/bootstrap-vue.css";
</style>
