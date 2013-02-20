class window.YandexMap

  constructor: ->
    @map = new ymaps.Map($("#map")[0], {center: [55.76, 37.64], zoom: 14})

    @map.behaviors.disable(['dblClickZoom', 'magnifier.rightButton'])
    @map.controls.add('smallZoomControl', { left: 5, top: 75 })

    @map.events.add('boundschange', =>
      console.log('bounds changed')

    )

  add_placemark: ->
