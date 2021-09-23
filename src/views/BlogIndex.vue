<template>
  <div class="Blog">
    <div class="container">
      <h1>Blog Index</h1>
      <div class="custom-card">
        <PostListCard
          v-for="(post, idx) in posts"
          :key="'posts' + idx"
          :post="post"
        />
        <div class="pagination">
          <b-pagination
            first-number
            last-number
            v-model="filter.page"
            :per-page="filter.limit"
            :total-rows="totalPost"
            @change="handlePageChange"
          ></b-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from "vue-property-decorator";
import { ActionMethod } from "vuex";

import { pageFilter, Post } from "@/types/common.types";
import { PostModule } from "@/store/namespace.names";
import { FETCH_POSTS } from "@/store/action.names";

import PostListCard from "@/components/post/PostListCard.vue";
import { TOTAL_POST } from "@/store/getter.names";

const DEFAULT_PARAMS: pageFilter = {
  page: 1,
  limit: 10,
};

@Component({
  components: {
    PostListCard,
  },
  name: "BlogIndex",
})
export default class BlogIndex extends Vue {
  @PostModule.Action(FETCH_POSTS) fetchPosts!: ActionMethod;
  @PostModule.Getter(TOTAL_POST) totalPost!: number;
  filter: pageFilter = JSON.parse(JSON.stringify(DEFAULT_PARAMS));
  posts: Post[] = [];

  handlePageChange(pageNumber: number): void {
    this.$router.push({
      name: "home",
      query: {
        route: "blog-index",
        page: pageNumber.toString(),
        limit: this.filter.limit.toString(),
      },
    });
  }

  setFilterValue(): void {
    if (this.$route.query.page && this.$route.query.limit) {
      this.filter.page = parseInt(this.$route.query.page as string);
      this.filter.limit = parseInt(this.$route.query.limit as string);
    }
  }

  @Watch("filter", { deep: true })
  // eslint-disable-next-line
  handleFilterChange(val: pageFilter, oldVal: pageFilter): void {
    this.fetchPostData();
  }

  fetchPostData(): void {
    this.setFilterValue();
    const payload = {
      page: this.filter.page,
      limit: this.filter.limit,
    };
    this.fetchPosts(payload).then((posts: Post[]) => {
      this.posts = posts;
    });
  }

  mounted(): void {
    this.fetchPostData();
  }
}
</script>

<style lang="scss" scoped>
.custom-card {
  max-width: 800px;
  margin: auto;
}
.pagination {
  display: flex;
  justify-content: center;
}
</style>
