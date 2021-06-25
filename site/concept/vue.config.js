// vue.config.js
module.exports = {
  publicPath: process.env.BASE_URL || './',
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
