(function() {
  $(function() {
    var container, mplayer;
    mplayer = new Mplayer("https://mplayerjs.herokuapp.com");
    container = $('#say').find('.content');
    return container.find('button').click(function() {
      var lang, message;
      lang = container.find('select').val();
      message = container.find('textarea').val();
      return mplayer.play("http://translate.google.com/translate_tts?tl=" + lang + "&q=" + message);
    });
  });

}).call(this);
