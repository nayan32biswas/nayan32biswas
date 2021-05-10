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
  chainWebpack: (config) => {
    config.module
      .rule("pdf")
      .test(/\.(pdf)(\?.*)?$/)
      .use("file-loader")
      .loader("file-loader")
      .options({
        name: "assets/pdf/[name].[hash:8].[ext]",
      });
  },
};
