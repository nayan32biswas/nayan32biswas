<template>
  <div v-if="post" class="container pb-5">
    <div class="text-center">
      <img
        v-if="post.coverImage"
        class="cover-image"
        :src="post.coverImage"
        :alt="post.coverImage"
      />
      <h1 class="m-2">{{ post.name }}</h1>
    </div>
    <div class="detail-description">
      <VueShowdown v-if="post" :markdown="post.content"></VueShowdown>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from "vue-property-decorator";
import { ActionMethod } from "vuex";
import { FETCH_POST } from "@/store/action.names";
import { PostDetails } from "@/types/common.types";
import { PostModule } from "../store/namespace.names";

@Component({
  components: {},
  name: "BlogDetails",
})
export default class BlogDetails extends Vue {
  @PostModule.Action(FETCH_POST) fetchPost!: ActionMethod;
  post: PostDetails | null = null;
  fetchContent(): void {
    const slug = this.$route.query.slug;
    this.fetchPost({ slug }).then((post: PostDetails) => {
      this.post = post;
    });
  }
  @Watch("$route", { deep: true })
  handleRouteChange(): void {
    this.fetchContent();
  }
  mounted(): void {
    this.fetchContent();
  }
}
</script>

<style lang="scss" scoped>
.cover-image {
  width: 80%;
}
.detail-description {
  width: 80%;
  margin: auto;
  max-width: 800px;

  background-color: #ededed;
  padding: 10px;
  border-radius: 5px;

  @media (max-width: 1199.98px) {
    width: 85%;
  }

  @media (max-width: 991.98px) {
    width: 90%;
  }
  @media (max-width: 767.98px) {
    width: 100%;
  }
}
.container {
  @media (max-width: 479.98px) {
    width: 100%;
  }
}
</style>
