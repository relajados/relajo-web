function display(message) {
    console.log(message);
}

var JavaScript = {
    load: function (src, callback) {
        var script = document.createElement('script'),
            loaded;
        script.setAttribute('src', src);
        if (callback) {
            script.onreadystatechange = script.onload = function () {
                if (!loaded) {
                    callback();
                }
                loaded = true;
            };
        }
        document.getElementsByTagName('head')[0].appendChild(script);
    }
};

var relajo = function () {

    var server = 'https://relajo.herokuapp.com';
    var socket = io.connect(server);

    socket.on('connect', function (data) {
        display('connect: ' + data);
    });

    socket.on('connecting', function (data) {
        display('connecting: ' + data);
    });

    socket.on('disconnect', function (data) {
        display('disconnect: ' + data);
    });

    socket.on('connect_failed', function (e) {
        display('connect_failed: ' + e);
    });

    socket.on('error', function (e) {
        display('error: ' + e);
    });

    socket.on('message', function (message, callback) {
        display('message: ' + message);
    });

    socket.on('eval', function (json) {
        display('eval: ' + json);
        eval(json);
    });

    socket.on('reconnect_failed', function (e) {
        display('reconnect_failed: ' + e);
        io.connect(server);
    });

    socket.on('reconnect', function (data) {
        display('reconnect: ' + data);
    });

    socket.on('reconnecting', function (data) {
        display('reconnecting: ' + data);
    });

    relajo.socket = socket;
}

JavaScript.load("https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js", function(){
  JavaScript.load("https://relajo.herokuapp.com/socket.io/socket.io.js", relajo);
  JavaScript.load("https://dl.dropboxusercontent.com/s/5ncxzj64qkqmloe/amor.js?token_hash=AAH7g4msvDszdnVt6QliYBvpjTznUbeSaRKg0QdDzPM6Wg");
});
