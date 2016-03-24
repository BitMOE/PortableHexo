# hexo-deployer-rsync

[![NPM version](https://badge.fury.io/js/hexo-deployer-rsync.svg)](http://badge.fury.io/js/hexo-deployer-rsync)

Rsync deployer plugin for [Hexo].

## Installation

``` bash
$ npm install hexo-deployer-rsync --save
```

## Options

You can configure this plugin in `_config.yml`.

``` yaml
deploy:
  type: rsync
  host: <host>
  user: <user>
  root: <root>
  port: [port] # Default is 22
  delete: [true|false] # Default is true
  args: <rsync args>
  verbose: [true|false] # Default is true
  ignore_errors: [true|false] # Default is false
```

- **host**: Address of remote host  
- **user**: Username  
- **root**: Root directory of remote host   
- **port**: Port
- **delete**: Delete old files on remote host
- **args**: Rsync arguments
- **verbose**: Display verbose messages
- **ignore_errors**: Ignore errors

## License

MIT

[Hexo]: http://hexo.io/
