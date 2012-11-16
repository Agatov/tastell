class window.FindPlacesButton extends Button

  onclick: ->
    @waiting_for_response()

    window.places_list = new PlacesList()

    $(places_list).bind("ready", @ready)

    places_list.initialize()
    places_list.render()

