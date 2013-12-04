$ ->
  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")
  container = $('#say').find('.content')

  container.find('button').click ->
    lang = container.find('select').val()
    message = container.find('textarea').val()
    mplayer.play "http://translate.google.com/translate_tts?tl=#{lang}&q=#{message}"
