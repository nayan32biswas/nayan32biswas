<template>
  <div class="Blog">
    <div>
      <VueShowdown v-if="post" :markdown="post.content"></VueShowdown>
    </div>
  </div>
</template>

<script lang="ts">
import { FETCH_POST } from "@/store/action.names";
import { PostDetails } from "@/types/common.types";
import { Component, Vue } from "vue-property-decorator";
import { ActionMethod } from "vuex";
import { PostModule } from "../store/namespace.names";

@Component({
  components: {},
  name: "BlogDetails",
})
export default class BlogDetails extends Vue {
  @PostModule.Action(FETCH_POST) fetchPost!: ActionMethod;
  post: PostDetails | null = null;

  mounted(): void {
    const slug = this.$route.params.slug;
    this.fetchPost({ slug }).then((post: PostDetails) => {
      this.post = post;
    });
  }
}
</script>
<style lang="sass" scoped></style>
