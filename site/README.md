<p align="center">
  <a title="DevDependency Status" href="https://david-dm.org/dbhi/dbhi?path=site&type=dev"><img src="https://img.shields.io/david/dev/dbhi/dbhi.svg?longCache=true&style=flat-square&label=devdeps&logo=npm&path=site"></a><!--
  -->
  <a title="Dependency Status" href="https://david-dm.org/dbhi/dbhi?path=site"><img src="https://img.shields.io/david/dbhi/dbhi.svg?longCache=true&style=flat-square&label=deps&logo=npm&path=site"></a><!--
  -->
  <a title="Site" href="https://dbhi.github.io"><img src="https://img.shields.io/website.svg?label=dbhi.github.io&longCache=true&style=flat-square&url=http%3A%2F%2Fdbhi.github.io%2Findex.html"></a><!--
  -->
  <a title="'site' workflow status" href="https://github.com/dbhi/dbhi/actions?query=workflow%3Asite"><img alt="'site' workflow status" src="https://img.shields.io/github/workflow/status/dbhi/dbhi/site?longCache=true&style=flat-square&label=site&logo=github"></a><!--
  -->
</p>

Use `yarn` (or `npm`) to install dependencies to subdir `node_modules`.

```sh
yarn
```

Then:

```sh
# start a server with watch and live-reloading
yarn serve

# or run an electron instance
yarn electron:serve
```

Last, package for distribution:

```bash
# build the frontend only (output to subdir 'dist')
yarn build

# or package it as an Electron application (output to subdir 'dist_electron')
yarn electron:build
```
