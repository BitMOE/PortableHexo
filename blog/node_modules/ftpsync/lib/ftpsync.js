// Design Notes
// ----------------------------------------------------------------------------
// TODO:
// - add verify() function
// - add touch() function
// - finish implementing timeSync()
// - fix time comparison on isModified

// Setup
// ----------------------------------------------------------------------------
var fs = require('fs');
var path = require('path');
var jsftp = require('jsftp');
var async = require('async');
var minimatch = require("minimatch");
var config = {};
if (fs.existsSync(process.cwd() + '/config.json')) {
  config = require(process.cwd() + '/config.json');
}

var settings;
var ftp;

var sync = exports = {
  settings: {
    'host': config.host,
    'port': config.port || 21,
    'user': config.user,
    'pass': config.pass,
    'local': config.local || process.cwd(),
    'remote': config.remote || '/',
    'ignore': config.ignore || {},
    'connections': config.connections || 1,
    'ltimeOffset': 0,
    'rtimeOffset': 0
  },

  log: {
    'verbose': config.verbose || false,
    'write': config.log || console.log,
    'info': config.info || console.info,
    'error': config.error || console.error,
    'warn': config.warn || console.warn
  },

  local: [],
  remote: [],
  mkdir: [],
  rmdir: [],
  add: [],
  update: [],
  remove: [],

  setup: function(callback) {
    settings = sync.settings;
    sync.log.write('Setup');
    if (sync.log.verbose) {
      sync.log.write('-------------------------------------------------------------');
    }
    // check the inputs
    if (!settings.host) { sync.log.warn("Host name not set"); }
    if (!settings.user) { sync.log.warn("User name not set"); }
    if (!settings.pass) { sync.log.warn("Password not set"); }
    
    // sensible defaults
    settings.ignore = settings.ignore || [];
    settings.connections = settings.connections || 1;
    
    // display the settings
    if (sync.log.verbose) {
      sync.log.write('Settings:');
      sync.log.write(settings);
      sync.log.write('');
    }
    // create the ftp instance
    try {
      ftp = new jsftp({
        host: settings.host,
        port: settings.port,
        user: settings.user,
        pass: settings.pass
      });
    }
    catch(err) {
      sync.log.error('Setup failed.');
      sync.log.write('');
      return callback(err);
    }
    sync.log.info('Setup complete.');
    sync.log.write('');
    callback(null);
  },

  collect: function(callback) {
    sync.log.write('Collecting');
    if (sync.log.verbose) {
      sync.log.write('-------------------------------------------------------------');
    }
    // fetch the file listings
    async.series([
      function(callback) {
        utils.walkLocal(settings.local, callback);
      },
      function(callback) {
        utils.walkRemote(settings.remote, callback);
      }
    ], function(err, results) {
      if (err) {
        sync.log.error('Collection failed.');
        sync.log.write('');
        return callback(err);
      }
      // store the values for later
      sync.local = results[0];
      sync.remote = results[1];
      if (sync.log.verbose) {
        sync.log.write('Local:');
        sync.log.write(sync.local);
        sync.log.write('');
        sync.log.write('Remote:');
        sync.log.write(sync.remote);
        sync.log.write('');
      }
      sync.log.info('Collection complete.');
      sync.log.write('');
      callback(null);
    });
  },

  consolidate: function(callback) {
    sync.log.write('Consolidating');
    if (sync.log.verbose) {
      sync.log.write('-------------------------------------------------------------');
    }
    // prepare the directory lists for comparison
    var rdirs = sync.remote.dirs;
    var ldirs = sync.local.dirs;
    // prepare the files lists for comparison
    var rFiles = helpers.lookupTable(sync.remote.files);
    var lFiles = helpers.lookupTable(sync.local.files);
    // compare directories for modifications
    rdirs.forEach(function(dir) {
      // if a match is found
      var lIDX = ldirs.indexOf(dir);
      if(lIDX !== -1) {
        var rIDX = rdirs.indexOf(dir);
        ldirs[lIDX] = '';
        rdirs[rIDX] = '';
      }
    });
    // compare files for modifications
    rFiles.forEach(function(file) {
      var lIDX = lFiles.indexOf(file);
      // if a match is found
      if (lIDX !== -1) {
        var rIDX = rFiles.indexOf(file);
        var lFile = sync.local.files[lIDX];
        var rFile = sync.remote.files[rIDX];
        if (helpers.isDifferent(sync.local.files[lIDX], sync.remote.files[rIDX])) {
          sync.update.push(file);
        }
        // mark updates as processed
        lFiles[lIDX] = '';
        rFiles[rIDX] = '';
      }
    });
    // process the rest
    ldirs.forEach(function(dir) {
      if(dir === '') { return; }
      sync.mkdir.push(dir);
    });
    rdirs = rdirs.reverse();
    rdirs.forEach(function(dir) {
      if(dir === '') { return; }
      sync.rmdir.push(dir);
    });
    lFiles.forEach(function(file) {
      if(file === '') { return; }
      sync.add.push(file);
    });
    rFiles.forEach(function(file) {
      if(file === '') { return; }
      sync.remove.push(file);
    });

    // log the results
    if (sync.log.verbose) {
      sync.log.write('Mkdir:');
      sync.log.write(sync.mkdir);
      sync.log.write('');
      sync.log.write('Rmdir:');
      sync.log.write(sync.rmdir);
      sync.log.write('');
      sync.log.write('Add:');
      sync.log.write(sync.add);
      sync.log.write('');
      sync.log.write('Updates:');
      sync.log.write(sync.update);
      sync.log.write('');
      sync.log.write('Remove:');
      sync.log.write(sync.remove);
      sync.log.write('');
    }
    sync.log.info('Consolidation complete.');
    sync.log.write('');
    callback(null);
  },

  commit: function(callback) {
    sync.log.write('Committing');
    if (sync.log.verbose) {
      sync.log.write('-------------------------------------------------------------');
    }
    async.series([
      // add directories
      function(callback) {
        if (sync.mkdir.length === 0) { callback(null, 'no mkdirs'); return; }
        async.mapLimit(sync.mkdir, 1, utils.mkdir, function (err) {
          if (err) {
            sync.log.error('MKDIRs failed.');
            return callback(err);
          }
          sync.log.info('MKDIRs complete.');
          callback(null);
        });
      },
      // add files
      function(callback) {
        if (sync.add.length === 0) { callback(null, 'no additions'); return; }
        async.mapLimit(sync.add, settings.connections, utils.upload, function (err) {
          if (err) {
            sync.log.error('Additions failed.');
            return callback(err);
          }
          sync.log.info('Additions complete.');
          callback(null);
        });
      },
      // update files
      function(callback) {
        if (sync.update.length === 0) { callback(null, 'no updates'); return; }
        async.mapLimit(sync.update, settings.connections, utils.upload, function (err) {
          if (err) {
            sync.log.error('Updates failed.');
            return callback(err);
          }
          sync.log.info('Updates complete.');
          callback(null);
        });
      },
      // remove files
      function(callback) {
        if (sync.remove.length === 0) { callback(null, 'no removals'); return; }
        async.mapLimit(sync.remove, 1, utils.remove, function (err) {
          if (err) {
            sync.log.error('Removals failed.');
            return callback(err);
          }
          sync.log.info('Removals complete');
          callback(null);
        });
      },
      // remove directories
      function(callback) {
        if (sync.rmdir.length === 0) { callback(null, 'no rmdirs'); return; }
        async.mapLimit(sync.rmdir, 1, utils.rmdir, function (err) {
          if (err) {
            sync.log.error('RMDIRs failed.');
            return callback(err);
          }
          sync.log.info('RMDIRs complete.');
          callback(null);
        });
      }
    ],
    function(err, results) {
      if (err) {
        sync.log.error('Commit failed.');
        return callback(err);
      }
      sync.log.info('Commit complete.');
      callback(null);
    });
  },

  run: function(callback) {
    async.series([
      // setup
      function(callback) {
        sync.setup(callback);
      },
      // collect
      function(callback) {
        sync.collect(callback);
      },
      // consolidate
      function(callback) {
        sync.consolidate(callback);
      },
      // commit
      function(callback) {
        sync.commit(callback);
      }
    ],
    function(err, results) {
      if (err) {
        if (callback) {
          callback(err);
        }
        else {
          sync.log.error(err);
          process.exit();
        }
      }
      else {
        if (callback) {
          callback(null);
        }
        else {
          process.exit();
        }
      }
    });
  }
};

var utils = exports.utils = {
  walkLocal: function(dir, callback) {
    var dirs = [];
    var files = [];
    // walk the directory
    fs.readdir(dir, function(err, list) {
      if (err) {
        sync.log.error('fs.readdir failed.');
        return callback(err);
      }
      var i = 0;
      (function next() {
        var file = list[i++];
        // exit if all files are processed
        if (!file) { return callback(null, { 'dirs':dirs,'files':files }); }
        // get file/dir name/stats
        var path = dir + '/' + file;
        // skip ignore files
        if (helpers.isIgnored(helpers.trimPathRoot(settings.local, path))) {
          next();
          return;
        }
        fs.stat(path, function(err, stat) {
          if (err) {
            sync.log.error('fs.stat failed.');
            return callback(err);
          }
          // handle directories
          if (stat.isDirectory()) {
            // add the directory to the results
            dirs.push(helpers.trimPathRoot(settings.local, path));
            // concat results from recursive calls
            utils.walkLocal(path, function(err, res) { // recurse & shit
              dirs = dirs.concat(res.dirs);
              files = files.concat(res.files);
              next();
            });
            return;
          }
          // handle files
          if (stat.isFile()) {
            files.push({
              'id':helpers.trimPathRoot(settings.local, path),
              'size':stat.size,
              'time':new Date(stat.ctime)
            });
            next();
            return;
          }
          // skip everything else
          else { next(); }
        });
      })();
    });
  },

  walkRemote: function(dir, callback) {
    var dirs = [];
    var files = [];
    // walk the directory
    ftp.ls(dir, function(err, list) {
      if (err) {
        sync.log.error('ftp.ls failed.');
        return callback(err);
      }
      var i = 0;
      (function next() {
        var file = list[i++];
        // exit if all files are processed
        if (!file) { return callback(null, { 'dirs':dirs, 'files':files }); }
        // get file/dir name/stats
        var path = dir + '/' + file.name;
        // skip ignore files
        if (helpers.isIgnored(helpers.trimPathRoot(settings.remote, path))) {
          next();
          return;
        }
        // handle directories
        if (file.type === 1) {
          // add the directory to the results
          dirs.push(helpers.trimPathRoot(settings.remote, path));
          // concat results from recursive calls
          utils.walkRemote(path, function(err, res) { // recurse & shit
            dirs = dirs.concat(res.dirs);
            files = files.concat(res.files);
            next();
          });
          return;
        }
        // handle files
        if (file.type === 0) {
          // add the file to the results
          files.push({
            'id':helpers.trimPathRoot(settings.remote, path),
            'size':+file.size,
            'time':new Date(file.time)
          });
          next();
          return;
        }
        // skip everything else (ex sumlinks)
        else { next(); }
      })();
    });
  },

  mkdir: function(dir, callback) {
    dir = settings.remote + dir;
    ftp.raw.mkd(dir, function(err, data) {
      if (err) {
        sync.log.error('MKDIR failed.');
        return callback(err);
      }
      if (sync.log.verbose) {
        sync.log.write('-', dir, 'created successfuly');
      }
      callback();
    });
  },

  rmdir: function(dir, callback) {
    dir = settings.remote + dir;
    ftp.raw.rmd(dir, function(err, data) {
      if (err) {
        sync.log.error('RMDIR failed.');
        return callback(err);
      }
      if (sync.log.verbose) {
        sync.log.write('-', dir, 'deleted successfuly');
      }
      callback();
    });
  },

  // upload a file to the remote server
  upload: function(file, callback) {
    /*var ftp = new jsftp({
      host: settings.host,
      port: settings.port,
      user: settings.user,
      pass: settings.pass
    });*/
    var local = settings.local + file;
    var remote = settings.remote + file;
    ftp.put(local, remote, function(err) {
      if (err) {
        sync.log.error('ftp.put failed.');
        return callback(err);
      }
      if (sync.log.verbose) {
        sync.log.write('-', file, 'uploaded successfuly');
      }
      callback();
    });
  },

  remove: function(file, callback) {
    file = settings.remote + file;
    ftp.raw.dele(file, function(err, data) {
      if (err) {
        sync.log.error('Remove failed.');
        return callback(err);
      }
      if (sync.log.verbose) {
        sync.log.write('-', file, 'deleted successfuly');
      }
      callback();
    });
  }
};

var helpers = {
  // synchronizes the local and remote clocks
  syncTime: function(ltime, rtime) {
    // get the current date/time
    var now = new Date();
    // calculate the local time offset
    var ltimeOffset = (now.getTimezoneOffset() / 60);
    // round to the nearest hour
    var coeff = 1000 * 60 * 60;
    // greenwich mean time
    var gmtimeMM = new Date((Math.round(ltime / coeff) - ltimeOffset) * coeff);
    // local time
    var ltimeMM = new Date(Math.round(ltime / coeff) * coeff);
    // remote time
    var rtimeMM = new Date(Math.round(rtime / coeff) * coeff);
    // calculate the remote time offset
    var rtimeOffset = (rtimeMM - ltimeMM) / coeff;
    console.log('Offsets:');
    console.log('loffset: +' + ltimeOffset);
    console.log('roffset: +' + rtimeOffset);
  },

  // maps a file lookup table from an array of file objects
  lookupTable: function(array) {
    //if (!array) { return []; }
    var lookup = [];
    for (var i = 0, len = array.length; i < len; i++) {
      lookup[i] = array[i].id;
    }
    return lookup;
  },

  // trims the base dir of from the file path
  trimPathRoot: function(root, path) {
    var rdirs = root.split('/');
    var fdirs = path.split('/');
    return '/' + fdirs.splice((rdirs.length), (fdirs.length-rdirs.length)).join('/');
  },

  // compare local vs remote file sizes
  isDifferent: function(lfile, rfile) {
    return (lfile.size !== rfile.size);
  },

  // compare a local vs remote file for modification
  isModified: function(lfile, rfile) {
    // round to the nearest minute
    //var minutes = 1000 * 60;
    //var hours = 1000 * 60 * 60;
    //var ltime = new Date(((Math.round(ltime / minutes) * minutes) - (ltimeOffset * hours)));
    //var rtime = new Date(((Math.round(rtime / minutes) * minutes) - (rtimeOffset * hours)));
    //var ltime = new Date(Math.round(ltime / minutes) * minutes);
    //var rtime = new Date(Math.round(rtime / minutes) * minutes);
    //console.log('Compare:');
    //console.log('lTime: ' + ltime);
    //console.log('rTime: ' + rtime);
  },

  isIgnored: function(path) {
    // skip if no ignores are defined
    if (settings.ignore.length === 0) { return false; }
    // should the path be ignored?
    for(var i = 0, len = settings.ignore.length; i < len; i++) {
      if (minimatch(path, settings.ignore[i], {matchBase: true})) {
        return true;
      }
    }
    return false;
  }
};

module.exports = exports;
