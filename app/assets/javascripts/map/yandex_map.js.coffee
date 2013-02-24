class window.YandexMap

  constructor: ->
    @map = new ymaps.Map($("#map")[0], {center: [55.76, 37.64], zoom: 14})

    @map.behaviors.disable(['dblClickZoom', 'magnifier.rightButton'])
    @map.controls.add('smallZoomControl', { left: 5, top: 75 })

    @map.events.add('boundschange', =>
      console.log('bounds changed')

    )

  add_placemark: (place) ->

    balloonView = new MapApp.PlaceBalloonView({ model: place })

    balloonLayout = ymaps.templateLayoutFactory.createClass('$[properties.content]')
    ymaps.layout.storage.add('place#balloonLayout', balloonLayout)

    placemark = new ymaps.Placemark(
      place.latlng(),
      {
        content: balloonView.render().el
      },
      {
        balloonAutoPan: false,
        hideIconOnBalloonOpen: false,
        balloonShadow: false,
        balloonLayout: "place#balloonLayout",
        iconImageHref: '/assets/marker_empty.png',
        iconImageSize: [32, 32],
        iconImageOffset: [-20, -30]
      }
    )

    placemark.events.add("mouseenter",  =>
      placemark.balloon.open()
    )

    placemark.events.add("mouseleave", =>
      placemark.balloon.close()
    )

    placemark.events.add("balloonopen", =>
      placemark.options.set("iconImageHref", "/assets/marker_full.png")
    )

    placemark.events.add("balloonclose", =>
      placemark.options.set("iconImageHref", "/assets/marker_empty.png")
    )

    console.log(placemark.geometry)

    @map.geoObjects.add(placemark)