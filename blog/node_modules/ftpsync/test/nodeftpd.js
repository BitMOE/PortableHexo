var ftpd = require('ftpd');
var fs = require('fs');
var path = require('path');

var listenPort = process.env.PORT || 9999;

var server = new ftpd.FtpServer(process.env.IP || "127.0.0.1", {
    getInitialCwd: function () { return path.normalize("/"); },
    getRoot: function () { return path.normalize(process.cwd() + '/remote'); },
    useWriteFile: false,
    useReadFile: false
});

server.on('error', function (err) {
    console.log("FTP Server error:", err);
});

server.on("client:connected", function(conn) {
    var username = null;
    console.log("client connected: " + conn.remoteAddress);
    conn.on("command:user", function(user, success, failure) {
        if (user) {
            username = user;
            success();
        } else failure();
    });

    conn.on("command:pass", function(pass, success, failure) {
        if (pass) success(username);
        else failure();
    });
});
server.debugging = 4;
server.listen(listenPort);

console.log("Listening on port " + listenPort);
