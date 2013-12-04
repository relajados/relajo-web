$ ->
  # FIXME: This should use the included mplayer file
  mplayer = new Mplayer("https://mplayerjs.herokuapp.com")
  container = $('#play-media').find('.content')

  container.find('button#play').click ->
    mplayer.play container.find('input.play-media').val()

  container.find('button#stop').click ->
    mplayer.stop()
