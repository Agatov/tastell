class window.PlacesList

  constructor: (latlng) ->
    @el = $("#places-list")
    @latlng = latlng
    @places = []
    @geolocator = new Geolocator()

    @initialize()

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
    )

  add_place: (data) ->
    place = new Place(data, @)
    @places.push place


  render: ->
    _.each(@places, (place) =>
      console.log(place + " ... ... ")
      @el.append(place.render().el)
    )


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

  initialize: ->

  render: ->
    template = _.template($(@template).html())
    @el.html(template(@data))
    @

