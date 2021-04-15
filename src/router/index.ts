import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "Home",
    component: () => import("../views/Home.vue"),
  },
  {
    path: "/blog-index",
    name: "BlogIndex",
    component: () => import("../views/BlogIndex.vue"),
  },
  {
    path: "/blog-index/:filename",
    name: "BlogDetails",
    component: () => import("../views/BlogDetails.vue"),
  },
  {
    path: "/work",
    name: "Work",
    component: () => import("../views/Work.vue"),
  },
  {
    path: "/skill",
    name: "Skill",
    component: () => import("../views/Skill.vue"),
  },
  {
    path: "/resume",
    name: "Resume",
    component: () => import("../views/Resume.vue"),
  },
  {
    path: "/contact",
    name: "Contact",
    component: () => import("../views/Contact.vue"),
  },

  {
    path: "/about",
    name: "About",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import("../views/About.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
