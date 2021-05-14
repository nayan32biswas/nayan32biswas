// import axios from "axios";
// import { AxiosError } from "axios";
import { GetterTree, ActionTree, MutationTree, Module } from "vuex";

import { PostState, RootState } from "../../types/store.types";

// import { buildParams } from "../utils";

// import {} from "../endpoints";
import { TOTAL_POST } from "../getter.names";
import { FETCH_POSTS, FETCH_POST } from "../action.names";

// import {  } from "../mutation.names";
import { Post, PostDetails } from "../../types/common.types";
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
  async [FETCH_POSTS]({ commit }, { pageNumber, pageSize }): Promise<Post[]> {
    return new Promise((resolve) => {
      const start = (pageNumber - 1) * pageSize;
      const end = pageNumber * pageSize;
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
