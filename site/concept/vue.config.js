// vue.config.js
module.exports = {
  configureWebpack: {
    module: {
      rules: [
        {
          test: /\.md$/,
          use: [{ loader: "gray-matter-loader" }]
        }
      ]
    }
  }
};
