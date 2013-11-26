(function() {
  $(function() {
    var index, mplayer;
    mplayer = new Mplayer("https://mplayerjs.herokuapp.com");
    index = "https://dl.dropboxusercontent.com/s/r7w50sbrugaleqx/index.json?dl=1&token_hash=AAEM6DM-pXTohg0df9dzHxgv4l2V_gDnwRkJ_5dv9OtpNQ";
    return $.get(index, function(data) {
      var json;
      json = $.parseJSON(data);
      return $(json).each(function(index, item) {
        var button;
        button = $("<button />");
        button.text(item.name);
        button.on("click", function() {
          return mplayer.play(item.url);
        });
        return $("body").append(button);
      });
    });
  });

}).call(this);
