class window.PlacesList

  constructor: ->
    @el = $("#places-list")
    @places = []
    @geolocator = new Geolocator()

  initialize: ->

    _.bindAll(@, "get_places")

    $(@geolocator).bind("latlng_ready", @get_places)

    @geolocator.initialize()

  get_places: (data) ->
    $.get(
      "/places.json?latlng=#{@geolocator.latlng()}",
    (data) =>
      @add_place(place) for place in data.places
      @render()
      $(@).trigger("ready")
    )

  add_place: (data) ->
    place = new Place(data, @)
    @places.push place


  render: ->
    _.each(@places, (place) =>
      @el.append(place.render().el)
    )
    @el.show()


class window.Place

  template: "#place-list-item-template"
  tagName: 'li'
  tagClass: 'place'

  constructor: (data, parent) ->
    @el = $(document.createElement(@tagName))
    @el.addClass(@tagClass)

    @id = data.id
    @data = data
    @parent = @parent

  render: ->
    template = _.template($(@template).html())
    @el.html(template(@data))
    @

