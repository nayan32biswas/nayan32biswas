<template>
  <div class="card mb-2">
    <div class="row">
      <div class="col-md-4">
        <router-link
          class="cover-image"
          :to="{ name: 'blog-details', params: { slug: post.slug } }"
        >
          <img v-if="post.coverImage" :src="post.coverImage" alt="" />
          <img
            v-else
            src="@/assets/images/default-post-image.jpg"
            alt="default-post-image.jpg"
          />
        </router-link>
      </div>
      <div class="col-md-8">
        <router-link :to="{ name: 'blog-details', params: { slug: post.slug } }"
          ><h4 class="card-title">{{ post.name }}</h4></router-link
        >
        <p class="card-text">{{ post.shortDescription }}</p>
      </div>
    </div>
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

<style lang="scss" scoped>
.cover-image {
  img {
    width: 200px;
  }
}
</style>
