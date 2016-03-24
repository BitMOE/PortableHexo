#!/usr/bin/env node
var path = require('path')
var opts = {
  eslintConfig: {
    configFile: path.join(__dirname, 'standard.json'),
    useEslintrc: false
  }
}

require('../../').cli(opts)
