<template>
  <div class="Blog">
    <h3>{{ post.name }}</h3>
    <router-link :to="{ name: 'BlogDetails', params: { slug: post.slug } }">{{
      post.name
    }}</router-link>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Prop } from "vue-property-decorator";

import { Post } from "@/types/common.types";

@Component({
  name: "PostListCard",
})
export default class PostListCard extends Vue {
  @Prop() post!: Post;
}
</script>
<style lang="sass" scoped></style>
