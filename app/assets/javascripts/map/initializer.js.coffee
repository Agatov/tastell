$ ->
  $(window).resize( ->
    size_me()
  )

  waitForMap( ->
    size_me()

    #Инициализурем карту
    window.yandex_map = new YandexMap

    # Инициализируем Backbone.Marionette приложение
    MapApp.addInitializer( ->
      MapApp.places = new MapApp.Places
    )

    MapApp.start()

    MapApp.places.fetch()
  )


window.size_me = ->
  $("#map").css("height", $(window).height() - $("#header").height())


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )