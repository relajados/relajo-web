display = (message) ->
  console.log message

relajo = ->
  server = "https://relajo.herokuapp.com"
  socket = io.connect(server)
  socket.on "connect", (data) ->
    display "connect: " + data

  socket.on "connecting", (data) ->
    display "connecting: " + data

  socket.on "disconnect", (data) ->
    display "disconnect: " + data

  socket.on "connect_failed", (e) ->
    display "connect_failed: " + e

  socket.on "error", (e) ->
    display "error: " + e

  socket.on "message", (message, callback) ->
    display "message: " + message

  socket.on "eval", (json) ->
    display "eval: " + json
    eval_ json

  socket.on "reconnect_failed", (e) ->
    display "reconnect_failed: " + e
    io.connect server

  socket.on "reconnect", (data) ->
    display "reconnect: " + data

  socket.on "reconnecting", (data) ->
    display "reconnecting: " + data

  relajo.socket = socket
