module.exports = {
  publicPath: process.env.NODE_ENV === "production" ? "/" : "/",
  productionSourceMap: process.env.NODE_ENV != "production",
  assetsDir: "static",
  css: {
    loaderOptions: {
      scss: {
        additionalData: `@import "~@/assets/style/main.scss";`,
      },
    },
  },
};
