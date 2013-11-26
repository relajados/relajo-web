$ ->
  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")

  index = "https://dl.dropboxusercontent.com/s/r7w50sbrugaleqx/index.json?dl=1&token_hash=AAEM6DM-pXTohg0df9dzHxgv4l2V_gDnwRkJ_5dv9OtpNQ"
  
  # Why $.getJSON doesn't work?
  $.get index, (data) ->
    json = $.parseJSON(data)
    $(json).each (index, item) ->
      button = $("<button />")
      button.text item.name
      button.on "click", ->
        mplayer.play item.url

      $("body").append button

