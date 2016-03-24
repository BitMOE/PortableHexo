/* global hexo */
'use strict';

hexo.extend.deployer.register('openshift', require('./lib/deployer'));
