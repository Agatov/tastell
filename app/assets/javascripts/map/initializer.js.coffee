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
      MapApp.map_places = new MapApp.MapPlaces
      MapApp.places_region.show(new MapApp.PlacesView({ collection: MapApp.places }))
    )

    MapApp.start()

    MapApp.places.fetch()
    MapApp.map_places.fetch()
  )

  $("#load-more-places").bind('click', ->
    MapApp.places.fetch({update: true, remove: false})
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