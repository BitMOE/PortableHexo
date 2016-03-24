# hexo-deployer-heroku

[![Build Status](https://travis-ci.org/hexojs/hexo-deployer-heroku.svg?branch=master)](https://travis-ci.org/hexojs/hexo-deployer-heroku)  [![NPM version](https://badge.fury.io/js/hexo-deployer-heroku.svg)](http://badge.fury.io/js/hexo-deployer-heroku) [![Coverage Status](https://coveralls.io/repos/hexojs/hexo-deployer-heroku/badge.svg)](https://coveralls.io/r/hexojs/hexo-deployer-heroku) [![Build status](https://ci.appveyor.com/api/projects/status/iepl4m8h1060p4nf/branch/master?svg=true)](https://ci.appveyor.com/project/tommy351/hexo-deployer-heroku/branch/master)

Heroku deployer plugin for [Hexo].

## Installation

``` bash
$ npm install hexo-deployer-heroku --save
```

## Options

You can configure this plugin in `_config.yml`.

``` yaml
# You can use this:
deploy:
  type: heroku
  repo: <repository url>
  message: [message]
```

- **repo**: Repository URL
- **message**: Commit message. The default commit message is `Site updated: {{ now('YYYY-MM-DD HH:mm:ss') }}`.

## Reset

Remove `.deploy_heroku` folder.

``` bash
$ rm -rf .deploy_heroku
```

## License

MIT

[Hexo]: http://hexo.io/