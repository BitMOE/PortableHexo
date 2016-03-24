/* global hexo */
'use strict';

hexo.extend.deployer.register('heroku', require('./lib/deployer'));
