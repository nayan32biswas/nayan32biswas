// import axios from "axios";
// import { AxiosError } from "axios";
import { GetterTree, ActionTree, MutationTree, Module } from "vuex";

import { PostState, RootState } from "../../types/store.types";

// import { buildParams } from "../utils";

// import {} from "../endpoints";
import { TOTAL_POST } from "../getter.names";
import { FETCH_POST_LIST } from "../action.names";

// import {  } from "../mutation.names";
import { Post } from "../../types/common.types";
import POST from "../postData";

const state: PostState = {
  postList: [],
  postDetails: {
    slug: "",
    name: "",
    filePath: "",
    isPublish: true,
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
  [FETCH_POST_LIST]({ commit }, { pageNumber, pageSize }): Post[] {
    const posts = POST.filter((post) => post.isPublish);
    const start = (pageNumber - 1) * pageSize;
    const end = pageNumber * pageSize;
    return posts.slice(start, end);
  },
};

const mutations: MutationTree<PostState> = {};

const userDataStore: Module<PostState, RootState> = {
  namespaced: true,
  getters,
  actions,
  mutations,
  state,
};

export default userDataStore;
