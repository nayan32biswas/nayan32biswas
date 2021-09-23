<template>
  <div>
    <div v-if="pageRoute == 'blog-index'"><BlogIndex /></div>
    <div v-else-if="pageRoute == 'blog-details'"><BlogDetails /></div>
    <div v-else-if="pageRoute == 'work'"><Work /></div>
    <div v-else-if="pageRoute == 'skill'"><Skill /></div>
    <div v-else-if="pageRoute == 'resume'"><Resume /></div>
    <div v-else><HomeBodyTop /></div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";

import HomeBodyTop from "../components/home/HomeBodyTop.vue";
import BlogIndex from "./BlogIndex.vue";
import BlogDetails from "./BlogDetails.vue";
import Work from "./Work.vue";
import Skill from "./Skill.vue";
import Resume from "./Resume.vue";

@Component({
  components: {
    HomeBodyTop,
    BlogIndex,
    BlogDetails,
    Work,
    Skill,
    Resume,
  },
})
export default class Home extends Vue {
  get pageRoute(): string {
    return this.$route.query.route as string;
  }
}
</script>
<style lang="scss" scoped></style>
