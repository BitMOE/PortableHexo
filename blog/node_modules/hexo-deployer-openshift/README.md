# hexo-deployer-openshift

[![Build Status](https://travis-ci.org/hexojs/hexo-deployer-openshift.svg?branch=master)](https://travis-ci.org/hexojs/hexo-deployer-openshift)  [![NPM version](https://badge.fury.io/js/hexo-deployer-openshift.svg)](http://badge.fury.io/js/hexo-deployer-openshift) [![Coverage Status](https://img.shields.io/coveralls/hexojs/hexo-deployer-openshift.svg)](https://coveralls.io/r/hexojs/hexo-deployer-openshift?branch=master) [![Build status](https://ci.appveyor.com/api/projects/status/6o6h5yfi3j16f06b/branch/master?svg=true)](https://ci.appveyor.com/project/tommy351/hexo-deployer-openshift/branch/master)

OpenShift deployer plugin for [Hexo].

## Installation

``` bash
$ npm install hexo-deployer-openshift --save
```

## Options

You can configure this plugin in `_config.yml`.

``` yaml
# You can use this:
deploy:
  type: openshift
  repo: <repository url>
  message: [message]
```

- **repo**: Repository URL
- **message**: Commit message. The default commit message is `Site updated: {{ now('YYYY-MM-DD HH:mm:ss') }}`.

## Reset

Remove `.deploy_openshift` folder.

``` bash
$ rm -rf .deploy_openshift
```

## License

MIT

[Hexo]: http://hexo.io/