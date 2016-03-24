'use strict';

var path = require('path');
var superstatic = require('superstatic');
var port = process.env.OPENSHIFT_NODEJS_PORT || 4000;
var host = process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0';

var app = superstatic({
  cwd: path.join(__dirname, 'public'),
  port: port,
  host: host
});

app.listen(function(err) {
  if (err) throw err;
  console.log('Server listening on http://%s:%s', host, port);
});
