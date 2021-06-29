module.exports = {
  publicPath: process.env.BASE_URL || './',
  transpileDependencies: ['vuetify'],
  pluginOptions: {
    // https://nklayman.github.io/vue-cli-plugin-electron-builder/guide/configuration.html#table-of-contents
    electronBuilder: {
      // nodeIntegration: true,
      builderOptions: {
        linux: {
          target: ['tar.gz', '7z'],
        },
      },
    },
  },
};
