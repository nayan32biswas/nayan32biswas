import Vue from "vue";
import VueRouter, { RouteConfig } from "vue-router";

Vue.use(VueRouter);

const routes: Array<RouteConfig> = [
  {
    path: "/",
    name: "home",
    component: () => import("../views/Home.vue"),
  },
  {
    path: "/blog",
    name: "blog-index",
    component: () => import("../views/BlogIndex.vue"),
  },
  {
    path: "/blog/:slug",
    name: "blog-details",
    component: () => import("../views/BlogDetails.vue"),
  },
  {
    path: "/work",
    name: "work",
    component: () => import("../views/Work.vue"),
  },
  {
    path: "/skill",
    name: "skill",
    component: () => import("../views/Skill.vue"),
  },
  {
    path: "/resume",
    name: "resume",
    component: () => import("../views/Resume.vue"),
  },
  {
    path: "/contact",
    name: "contact",
    component: () => import("../views/Contact.vue"),
  },

  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import("../views/About.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
