An FTP synchronization app for NodeJS based on [jsftp](https://npmjs.org/package/jsftp). With an emphasis on speed and simplicity ftpsync aims to fulfull your one-click file deployment needs.

[![NPM](https://nodei.co/npm/ftpsync.png)](https://nodei.co/npm/ftpsync/)


**Notice: The core functionality to push files to a remote server is now fully implemented. Until the timestamp comparison logic is worked out, updates (ie overwriting files) are determined solely by comparing file sizes. This is not ftp-deploy. This application will delete files and directories on the remote server to match the local machine. Use this application in production at your own risk.**

Usage
----------------

```js
$ ftpsync --help

 Usage: ftpsync [options]

 Options:

   -h, --help            output usage information
   -V, --version         output the version number
   -v, --verbose         Verbose logging
   -l, --local []        Local root path
   -r, --remote []       Remote root path
   -h, --host []         FTP host name/address
   -p, --port <>         FTP connection port
   -u, --user []         FTP user name
   -s, --pass []         FTP password
   -c, --connections <>  Max number of concurrent FTP connections
   -i, --ignore <items>  List of files to ignore (separated by commas)

```

*See [ftpsync.settings{}](#ftpsyncsettings) for detailed info about the settings.*

Using a config file
--------------

As an alternative to the traditional command line interface a config file may also be used to load the settings.

#### Step 1 - Create a configuration file

*config.json*
```js
{
  "local":"~/www/",
  "remote":"/",
  "host":"example.com",
  "port":21,
  "user":"username",
  "pass":"password",
  "connections":"2",
  "ignore":[
    ".htaccess"
  ]
}
```

*See [ftpsync.settings{}](#ftpsyncsettings) for detailed info about the settings.*

#### Step 2 - Place the config file in the directory where ftpsync will be exectued

*By default ftpsync will use the configuration supplied buy a config.json file located in the CWD.*

#### Step 3 - Run the script

`ftpsync`

#### Optional - Logging to a file

To log the output to a file simply pipe STDOUT to a log file.

`ftpsync > ftpsync.log &`

API
----------------

#### Declaring ftpsync
  
Basic usage example

    var ftpSync = require('ftpsync');
    
    var options = {
      host: 'localhost',
      user: 'testuser',
      pass: 'password',
      local: '/your/local/directory',
      remote: 'directoryname'
    };
    
    ftpSunc.settings = options;
    ftpSync.run(function(err, result) {
    
      ... your code ...
      
    };

  - `options{}` an object containing settings for ftpsync.

*See [ftpsync.settings{}](#ftpsyncsettings) for detailed info about the settings.*

#### ftpsync.settings{}

Contains the application settings for ftpsync.

  - `host` - hostname/address of the remote ftp server (required).
  - `port` - port of the remote ftp server (default `21`).
  - `user` - ftp username (required).
  - `pass` - ftp password (required).
  - `local` - the root directory of the local host (default `'./'`).
  - `remote` - the root path of the remote server (default `'./'`).
  - `connections` - the max number of concurrent ftp connections (default `1`).
  - `ignore` - the list of file patterns to ignore.

*Note: Ignore patterns can be defined as a filename, file path, or glob match.*

#### ftpsync.local{}

The file and directory listings for the local host.

- `ftpsync.local.dirs` - contains a simple list.

Each path represents a local directory.

- `ftpsync.local.files` - contains a list of objects.

Each object in the list represents a file and contains a `id`, `size`, and `time` attribute with the requisite values for that file.

Populated by running `collect()` or `utils.walkLocal()`.

#### ftpsync.remote{}

The file and directory listings for the remote host.

- `ftpsync.remote.dirs` - contains a simple list.

Each path represents a remote directory.

- `ftpsync.remote.files` - contains a list of objects.

Each object in the list represents a file and contains a `id`, `size`, and `time` attribute with the requisite values for that file.

Populated by running `collect()` or `utils.walkremote()`.

#### ftpsync.mkdir[]

The list of directories queued for creation on the remote server.

Populated by running `consolidate()`.

#### ftpsync.rmdir[]

The list of directories queued for deletion on the remote server.

Populated by running `consolidate()`.

#### ftpsync.add[]

The list of files queued to for addition to the remote server.

Populated by running `consolidate()`.

#### ftpsync.update[]

The list of files queued for update on the remote server.

Populated by running `consolidate()`.

#### ftpsync.remove[]

The list of files queued for removal from the remote server.

Populated by running `consolidate()`.

### Methods

#### ftpsync.run(callback)

Completes the full synchronization from start to finish. Runs `setup()`, `collect()`, `consolidate()`, `commit()`, and `validate()`.

#### ftpsync.setup(callback)

The initialization step of the sunchronization process. This function accomplishes two tasks, First, it checks to see that all the required settings are present. Second, it synchronizes the local host and remote server clocks.

*The setup will fail if the following settings aren't defined:*

  - `host`
  - `port`
  - `user`
  - `pass`

*See [ftpsync.settings{}](#ftpsyncsettings) for detailed info about the settings.*

#### ftpsync.collect(callback)

Walks the file trees for both the local host and remote server and prepares them for further processing. The resulting file lists are stored in `local[]`, and `remote[]` upon successful completion.

#### ftpsync.consolidate(callback)

Runs comparisons on the local and remote file listings. Files that exist in the local directory are but not the remote are queued up for addition. Files that exist in both but are different (determined by file size and time stamp) are queued for update. Files that exist in on the remote directory but not the local are queued for removal. The resulting queues can be found in `add[]`, `update[]`, and `remove[]` upon successful completion.

#### ftpsync.commit(callback)

Executes the tasks contained in the `add[]`, `update[]`, and `remove[]` lists.

### Helper Methods

#### ftpsync.utils.walkLocal(dir, callback)

Walks the local directory tree and returns a list of files.

*Requires `setup()` to be run first.*

#### ftpsync.utils.walkRemote(dir, callback)

Walks the remote directory tree and returns a list of files.

*Requires `setup()` to be run first.*

Installation
------------

    npm install -g ftpsync

*The -g flag indicates that this package will be installed globally. If you'd like to install it directly to a file locally simply remove the flag.*

Roadmap
-------
### Short Term
 - Implement timestamp file comparisons on updates

### Long Term
 - Pull functionality
 - Two-way sync

### Pipe Dream
 - Comprehensive testing - Requires a non-sucky ftp server implementation written in node.

License
-------

MIT. See LICENSE.
