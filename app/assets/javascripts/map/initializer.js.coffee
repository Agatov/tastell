$ ->
  $(window).resize( ->
    size_me()
  )

  waitForMap( ->
    size_me()

    #Инициализурем карту
    window.yandex_map = new YandexMap

    MapApp.addRegions({
      places_region: '#places-list'
    })

    # Инициализируем Backbone.Marionette приложение
    MapApp.addInitializer( ->
      MapApp.places = new MapApp.Places
      MapApp.places_region.show(new MapApp.PlacesView({ collection: MapApp.places }))
    )

    MapApp.start()

    MapApp.places.fetch()
  )


window.size_me = ->
#  $("#map").css("height", $(window).height() - $("#header").height())


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )