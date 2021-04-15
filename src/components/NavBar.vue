<template>
  <div class="nav">
    <div class="logo">
      <router-link :to="{ name: 'Home' }">Nayan.</router-link>
    </div>
    <div class="menu">
      <ul v-if="!mobileNav">
        <li class="item" v-if="!mobileNav">
          <span>power-search</span>
        </li>
        <li class="item">
          <router-link :to="{ name: 'BlogIndex' }">Blog</router-link>
        </li>
        <li class="item">
          <router-link :to="{ name: 'Work' }">Work</router-link>
        </li>
        <li class="item">
          <router-link :to="{ name: 'Skill' }">Skill</router-link>
        </li>

        <li class="item">
          <router-link :to="{ name: 'Resume' }">Resume</router-link>
        </li>
        <li class="item">
          <router-link :to="{ name: 'Contact' }">Contact</router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from "vue-class-component";

@Options({
  props: {
    msg: String,
  },
})
export default class NavBar extends Vue {
  msg!: string;
  mobileNav = false;

  created() {
    this.handleView();
  }
  handleView() {
    this.mobileNav = window.innerWidth <= 768;
    window.addEventListener("resize", this.handleView);
  }
}
</script>

<style lang="scss">
.logo {
  font-size: 30px;
}
.nav {
  padding: 10px 5%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: $nav-top-color;
}
.menu {
  float: left;
  ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
  }
  li {
    display: inline;
  }
  .item {
    padding: 0 5px;
  }
}
a {
  &.router-link-exact-active {
    color: #42b983;
  }
}
</style>
