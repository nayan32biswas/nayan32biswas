import Vue from "vue";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import VueShowdown from "vue-showdown";

Vue.use(VueShowdown, {
  // set default flavor of showdown
  flavor: "github",
  // set default options of showdown (will override the flavor options)
  options: {
    emoji: false,
  },
});

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

// function checkAuth(to: any, from: any, next: any) {
//   const loggedIn = store.getters[namespaced(NS_USER, TOKEN)] != null;
//   const accessLevel = store.getters[namespaced(NS_USER, ACCESS_LEVEL)];
//   // console.log(from, to, accessLevel, loggedIn);
//   if (to.meta?.accessLevel != null) {
//     if (loggedIn) {
//       if (to.meta?.accessLevel <= accessLevel) {
//         next();
//       } else {
//         next("/");
//       }
//     } else {
//       next("/login");
//     }
//   } else {
//     next();
//   }
// }
// router.beforeEach((to, from, next) => {
//   checkAuth(to, from, next);
//   store.commit(namespaced(NS_PUBLIC, SET_COURSE_SEARCH_RESULTS), null);
//   if (from == null || from.name == null) {
//     store.dispatch(namespaced(NS_USER, GET_TOKEN_FROM_LOCAL_STORE)).then(() => {
//       checkAuth(to, from, next);
//     });
//   } else {
//     checkAuth(to, from, next);
//   }
// });

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
