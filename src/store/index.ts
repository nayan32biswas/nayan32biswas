import Vue from "vue";
import Vuex from "vuex";
import postDataStore from "./modules/post";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    projectName: "Nayan Portfolio",
  },
  mutations: {},
  actions: {},
  modules: {
    post: postDataStore,
  },
});
