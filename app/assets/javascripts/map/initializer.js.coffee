$ ->
  $(window).resize( ->
    size_me()
  )

  waitForMap( ->
    size_me()

    #Инициализурем карту
    window.yandex_map = new ymaps.Map($("#map")[0], {center: [55.76, 37.64], zoom: 14})

    # Инициализируем Backbone.Marionette приложение
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