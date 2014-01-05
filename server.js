console.log("Dating-With-Node");

var path        = require('path');
var express     = require('express');
var colors      = require('colors');
var settings    = require('./app/config/settings');

module.exports.start = function (done) {
    var app = express();

    app.listen(settings.port, function () {
        console.log( ("Dating-With-Node Listening on port " + settings.port).green );

        if (done) {
            return done(null, app, server);
        }
    }).on('error', function (e) {
            if (e.code == 'EADDRINUSE') {
                console.log('Address in use. Is the server already running?'.red);
            }
            if (done) {
                return done(e);
            }
        });
}

// If someone ran: "node server.js" then automatically start the server
if (path.basename(process.argv[1],'.js') == path.basename(__filename,'.js')) {
    module.exports.start()
}
