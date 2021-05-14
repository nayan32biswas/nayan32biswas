<template>
  <div class="Blog">
    <div>
      <VueShowdown
        v-if="post"
        :markdown="
          require('!!html-loader!markdown-loader!@/assets/posts/android-studio.md')
        "
      ></VueShowdown>
    </div>
  </div>
</template>

<script lang="ts">
import { FETCH_POST } from "@/store/action.names";
import { Post } from "@/types/common.types";
import { Component, Vue } from "vue-property-decorator";
import { ActionMethod } from "vuex";
import { PostModule } from "../store/namespace.names";

@Component({
  components: {},
  name: "BlogDetails",
})
export default class BlogDetails extends Vue {
  @PostModule.Action(FETCH_POST) fetchPost!: ActionMethod;
  post: Post | null = null;
  path = "@/assets/posts/android-studio.md";

  mounted(): void {
    const slug = this.$route.params.slug;
    this.fetchPost({ slug }).then((post: Post | null) => {
      this.post = post;
    });
  }
}
</script>
<style lang="sass" scoped></style>
