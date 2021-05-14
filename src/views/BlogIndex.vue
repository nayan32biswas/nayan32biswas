<template>
  <div class="Blog">
    <h1>Blog Index</h1>
    <router-link
      :to="{ name: 'BlogDetails', params: { filename: 'demo-file' } }"
      >Blog detaiils</router-link
    >
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import { ActionMethod } from "vuex";

import { Post } from "@/types/common.types";
import { PostModule } from "@/store/namespace.names";
import { FETCH_POSTS } from "@/store/action.names";

@Component({
  name: "BlogIndex",
})
export default class BlogIndex extends Vue {
  @PostModule.Action(FETCH_POSTS) fetchPosts!: ActionMethod;
  pageNumber = 1;
  pageSize = 10;
  posts: Post[] | null = null;

  mounted(): void {
    const payload = {
      pageNumber: this.pageNumber,
      pageSize: this.pageSize,
    };
    this.fetchPosts(payload).then((posts: Post[]) => {
      this.posts = posts;
    });
  }
}
</script>
<style lang="sass" scoped></style>
