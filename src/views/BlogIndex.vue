<template>
  <div class="Blog">
    <h1>Blog Index</h1>
    <PostListCard
      v-for="(post, idx) in posts"
      :key="'posts' + idx"
      :post="post"
    />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import { ActionMethod } from "vuex";

import { Post } from "@/types/common.types";
import { PostModule } from "@/store/namespace.names";
import { FETCH_POSTS } from "@/store/action.names";

import PostListCard from "@/components/post/PostListCard.vue";

@Component({
  components: {
    PostListCard,
  },
  name: "BlogIndex",
})
export default class BlogIndex extends Vue {
  @PostModule.Action(FETCH_POSTS) fetchPosts!: ActionMethod;
  pageNumber = 1;
  pageSize = 10;
  posts: Post[] = [];

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
