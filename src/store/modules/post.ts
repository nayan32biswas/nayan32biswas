// import axios from "axios";
// import { AxiosError } from "axios";
import { GetterTree, ActionTree, MutationTree, Module } from "vuex";

import { PostState, RootState } from "../../types/store.types";

// import { buildParams } from "../utils";

// import {} from "../endpoints";
import { TOTAL_POST } from "../getter.names";
import { FETCH_POSTS, FETCH_POST } from "../action.names";

// import {  } from "../mutation.names";
import { Post } from "../../types/common.types";
import POST from "../postData";

const state: PostState = {
  postList: [],
  postDetails: {
    slug: "",
    name: "",
    filePath: "",
    isPublished: true,
    tags: [],
    shortDescription: "",
  },
  error: false,
};

const getters: GetterTree<PostState, RootState> = {
  [TOTAL_POST](): number {
    return POST.length;
  },
};

const actions: ActionTree<PostState, RootState> = {
  async [FETCH_POSTS]({ commit }, { pageNumber, pageSize }): Promise<Post[]> {
    // Post[]
    return new Promise((resolve) => {
      const start = (pageNumber - 1) * pageSize;
      const end = pageNumber * pageSize;
      const posts = POST.filter((post) => post.isPublished);
      resolve(posts.slice(start, end));
    });
  },
  [FETCH_POST]({ commit }, { slug }): Post | undefined {
    return POST.find((post) => post.slug == slug);
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
