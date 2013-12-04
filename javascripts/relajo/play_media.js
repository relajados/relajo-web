(function() {
  $(function() {
    var container, mplayer;
    mplayer = new Mplayer("https://mplayerjs.herokuapp.com");
    container = $('#play-media').find('.content');
    container.find('button#play').click(function() {
      return mplayer.play(container.find('input.play-media').val());
    });
    return container.find('button#stop').click(function() {
      return mplayer.stop();
    });
  });

}).call(this);
