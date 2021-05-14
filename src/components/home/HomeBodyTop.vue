<template>
  <div class="top-body">
    <div class="container">
      <div class="body-title">
        <div>
          {{ "HEY! I AM" }}
        </div>
        <div class="title">
          <h1>Nayan Biswas</h1>
        </div>
        <div class="designation">I'm a <span>Software Engineer</span></div>
      </div>
      <div class="contact">
        <div class="item">
          <div>Phone</div>
          <div>+8801755767658</div>
        </div>
        <div class="item">
          <MediaList />
        </div>
        <div class="item">
          <div>Drop your Message</div>
          <div>nayan32biswas@gmail.com</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

import MediaList from "./MediaList.vue";

@Component({
  components: {
    MediaList,
  },
  name: "HomeBodyTop",
})
export default class HomeBodyTop extends Vue {}
</script>
<style lang="scss" scoped>
.top-body {
  background-color: $nav-top-color;
}
.body-title {
  text-align: center;
  padding: 10% 0;
}
.contact {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 5%;

  .item {
    width: 100%;
  }
  .item:nth-child(2) {
    text-align: center;
  }
  .item:nth-child(3) {
    text-align: end;
  }

  @media (max-width: 560px) {
    display: block;
    text-align: center;
    .item {
      padding-bottom: 10px;
      text-align: center !important;
    }
  }
}
</style>
