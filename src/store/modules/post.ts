// import axios from "axios";
// import { AxiosError } from "axios";
import { GetterTree, ActionTree, MutationTree, Module } from "vuex";

import { PostState, RootState } from "../../types/store.types";

// import { buildParams } from "../utils";

// import {} from "../endpoints";
import { TOTAL_POST } from "../getter.names";
import { FETCH_POSTS, FETCH_POST } from "../action.names";

// import {  } from "../mutation.names";
import { Post, PostDetails, PostContent } from "../../types/common.types";
import POST from "../postData";
import POST_CONTENT from "../postContent";

const state: PostState = {
  postList: [],
  postDetails: {
    slug: "",
    name: "",
    isPublished: true,
    coverImage: "",
    tags: [],
    relatedPosts: [],
    shortDescription: "",
    content: "",
  },
  error: false,
};

const getters: GetterTree<PostState, RootState> = {
  [TOTAL_POST](): number {
    return POST.length;
  },
};

const actions: ActionTree<PostState, RootState> = {
  // eslint-disable-next-line
  async [FETCH_POSTS]({ commit }, { page, limit }): Promise<Post[]> {
    return new Promise((resolve) => {
      const start = (page - 1) * limit;
      const end = page * limit;
      const posts = POST.filter((post) => post.isPublished).slice(start, end);
      resolve(posts);
    });
  },
  // eslint-disable-next-line
  async [FETCH_POST]({ commit }, { slug }): Promise<PostDetails | null> {
    return new Promise((resolve) => {
      const post = POST.find((post) => post.slug == slug) || null;
      if (post) {
        const content = POST_CONTENT.find((post) => post.slug == slug) || {
          content: "",
        };
        resolve({
          ...post,
          content: content.content,
        });
      }
      resolve(null);
    });
  },
};

const mutations: MutationTree<PostState> = {};

const postDataStore: Module<PostState, RootState> = {
  namespaced: true,
  getters,
  actions,
  mutations,
  state,
};

export default postDataStore;

(function () {
  const postListSlugs = new Set(POST.map((post: Post) => post.slug));
  const postContentSlugs = new Set(
    POST_CONTENT.map((post: PostContent) => post.slug)
  );
  // eslint-disable-next-line
  function symmetricDifference(setA: any, setB: any) {
    const _difference = new Set(setA);
    for (const elem of setB) {
      if (_difference.has(elem)) {
        _difference.delete(elem);
      } else {
        _difference.add(elem);
      }
    }
    return _difference;
  }
  const differ = symmetricDifference(postListSlugs, postContentSlugs);
  if (differ.size) {
    throw `List not match. "${[...differ].join(", ")}"`;
  }
})();
