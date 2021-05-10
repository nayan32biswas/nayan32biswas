const marked = require("marked");
const markdownRenderer = new marked.Renderer();

// webpack.config.js
module.exports = {
  module: {
    rules: [
      {
        test: /\*\.(md|MD)$/i,
        exclude: /node_modules/,
        use: [
          {
            loader: "html-loader",
          },
          {
            loader: "markdown-loader",
            options: {
              pedantic: true,
              renderer: markdownRenderer,
            },
          },
        ],
      },
    ],
  },
};
