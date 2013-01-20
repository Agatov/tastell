$ ->
  $("#place-photos").slides({
    container: 'photos',
    generatePagination: false,
    generateNextPrev: false,
    next: 'photo-container',
    prev: 'arrow-left',
    play: 5000
  })


  window.waitForMap = (callback) ->
    if ymaps.Map
      callback(this)
    else
      setTimeout(
        ->
          waitForMap(callback)
        500
      )

  waitForMap( ->
    map = new ymaps.Map('place-map', {center: [55.76, 37.64], zoom: 14})

    myBalloonLayout = ymaps.templateLayoutFactory.createClass('$[properties.content]');
    ymaps.layout.storage.add('my#superlayout', myBalloonLayout);



    placemark = new ymaps.Placemark(
      [55.76, 37.64],
      {
        content: $("#balloon-template").html()
      },
      {
        balloonAutoPan: false,
        hideIconOnBalloonOpen: false,
        balloonShadow: false,
        balloonLayout: "my#superlayout",
        #iconImageHref: '/images/marker_empty.png',
        iconImageSize: [32, 32],
        iconImageOffset: [-20, -30]
      }
    )

    placemark.events.add("mouseleave", (that) =>
      placemark.balloon.close()
    )

    placemark.events.add("mouseenter", (that) =>
      placemark.balloon.open()
    )

    map.geoObjects.add(placemark)

  )


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )


