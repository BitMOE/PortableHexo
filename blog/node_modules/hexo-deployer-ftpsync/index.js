var ftpsync = require('ftpsync');

hexo.extend.deployer.register('ftpsync', function(args, callback){
  if (!args.host || !args.user || args.pass == null){
    var help = [
      'You should argsure deployment settings in _config.yml first!',
      '',
      'Example:',
      '  deploy:',
      '    type: ftpsync',
      '    host: <host>',
      '    port: [port] # Default is 21',
      '    remote: [remote] # Default is `/`',
      '    user: <user>',
      '    pass: <pass>',
      '    ignore: [ignore]',
      '    connections: [connections] # Default is 1',
      '',
      'For more help, you can check the docs: ' + 'http://hexo.io/docs/deployment.html'.underline
    ];

    console.log(help.join('\n'));
    return callback();
  }

  ftpsync.settings = {
    local: hexo.public_dir,
    host: args.host,
    port: args.port || 21,
    remote: args.remote || '/',
    user: args.user,
    pass: args.pass,
    connections: args.connections || 1,
    ignore: args.ignore || []
  };
  ftpsync.log.verbose = (args.verbose || false);

  if (ftpsync.settings.port > 65535 || ftpsync.settings.port < 1){
    ftpsync.settings.port = 21;
  }

  ftpsync.run(callback);
});
