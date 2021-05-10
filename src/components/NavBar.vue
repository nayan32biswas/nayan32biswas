<template>
  <div class="nav">
    <div class="logo">
      <router-link :to="{ name: 'Home' }">Nayan.</router-link>
    </div>
    <div class="menu">
      <nav v-if="!mobileNav" class="desktop-menu">
        <ul>
          <li class="nav-item power-search" @click.prevent="toggolShowModal">
            <img src="@/assets/icon/volt.svg" alt="search" />
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'BlogIndex' }">Blog</router-link>
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'Work' }">Work</router-link>
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'Skill' }">Skill</router-link>
          </li>

          <li class="nav-item">
            <router-link :to="{ name: 'Resume' }">Resume</router-link>
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'Contact' }">Contact</router-link>
          </li>
        </ul>
      </nav>
      <nav v-else class="mobile-menu">
        <ul class="top-icons">
          <li class="nav-item power-search" @click.prevent="toggolShowModal">
            <img src="@/assets/icon/volt.svg" alt="search" />
          </li>
          <li class="nav-item hamburger" @click.prevent="toggolNavExpand">
            <img src="@/assets/icon/hamburger.svg" alt="menu" />
          </li>
        </ul>
        <div
          v-if="navExpand"
          class="expanded-nav"
          @click.prevent="toggolNavExpand"
        >
          <div class="cross">
            <img src="@/assets/icon/cross.svg" alt="menu" />
          </div>
          <ul>
            <li class="nav-item">
              <router-link :to="{ name: 'BlogIndex' }">Blog</router-link>
            </li>
            <li class="nav-item">
              <router-link :to="{ name: 'Work' }">Work</router-link>
            </li>
            <li class="nav-item">
              <router-link :to="{ name: 'Skill' }">Skill</router-link>
            </li>

            <li class="nav-item">
              <router-link :to="{ name: 'Resume' }">Resume</router-link>
            </li>
            <li class="nav-item">
              <router-link :to="{ name: 'Contact' }">Contact</router-link>
            </li>
          </ul>
        </div>
      </nav>
    </div>
    <Modal v-model="showModal" @input="showModal = false">
      <template v-slot:header>
        <div>Implement search</div>
      </template>
    </Modal>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Prop } from "vue-property-decorator";

import Modal from "./Modal.vue";

@Component({
  components: {
    Modal,
  },
  name: "NavBar",
})
export default class NavBar extends Vue {
  @Prop() msg!: string;
  mobileNav = false;
  navExpand = false;
  showModal = true;

  toggolNavExpand(): void {
    this.navExpand = !this.navExpand;
  }
  toggolShowModal(): void {
    this.showModal = !this.showModal;
  }

  created(): void {
    console.log("created nav");
    this.handleView();
  }
  handleView(): void {
    this.mobileNav = window.innerWidth <= 768 - 768 * 0.2;
    window.addEventListener("resize", this.handleView);
  }
}
</script>

<style lang="scss">
.logo {
  font-size: 30px;
}
.nav {
  padding: 0 5% !important;
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: $nav-top-color;
}
.menu {
  float: left;
  .nav-item {
    padding: 5px 5px;
    font-size: 20px;
  }
  .desktop-menu {
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    li {
      display: inline;
    }

    a {
      &.router-link-exact-active {
        color: #42b983;
      }
    }
  }
  .mobile-menu {
    ul {
      list-style-type: none;
      padding-inline-start: 0;
      margin-block-start: 0;
      margin-block-end: 0;
    }
    .top-icons {
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .expanded-nav {
      position: fixed;
      top: 0;
      right: 0;
      background-color: white;
      width: 200px;
      height: 100%;
      z-index: 9;

      // &:before {
      //   background-color: #42b983;
      //   transform: translateX(-100%);
      //   transition: opacity 0.3s ease-out;
      // }

      // &:after {
      //   background-color: red;
      //   transform: translateX(100%);
      //   transition: opacity 0.3s ease-out;
      // }

      .cross {
        display: flex;
        justify-content: center;
        cursor: pointer;
        height: 60px;

        img {
          height: auto;
          width: 50px;
        }
      }
      .nav-item {
        padding-left: 10px;
        a {
          display: block;
        }
        &:hover {
          background-color: rgb(149, 149, 155);
        }
      }
    }
  }
}
.power-search {
  cursor: pointer;
  img {
    border-radius: 50%;
    padding: 7px 10px;
    background-color: white;
  }
}
.hamburger {
  cursor: pointer;
  img {
    height: auto;
    width: 35px;
  }
}
</style>
