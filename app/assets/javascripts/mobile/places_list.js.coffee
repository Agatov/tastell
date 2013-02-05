class window.PlacesList

  constructor: ->
    @el = $("#places-list")
    @no_results = @el.find('#no-results')
    @places = []
    @geolocator = new Geolocator()
    @search = null

  initialize: ->

    _.bindAll(@, "get_places")

    $(@geolocator).bind("latlng_ready", @get_places)
    $(@geolocator).bind('latlng_fail', @get_places)

    @geolocator.initialize()

  add_search: (search) ->
    @search = search
    $(@search).bind('value_changed', @get_places)

  get_places: (data) ->
#    if @geolocator.latlng()
#      url = "/places.json?latlng=#{@geolocator.latlng()}"
#    else
#      url = "/places.json"

    if @search
      url = "/places.json?search=#{@search.value}"
    else
      url = "/places.json"

    $.get(
      url,
    (data) =>
      @clear_places()

      if data.places
        @add_place(place) for place in data.places

      @render()
      $(@).trigger("ready")
    )

  add_place: (data) ->
    place = new Place(data, @)
    @places.push place

  remove_place: (place) ->
    place.remove()

  clear_places: ->
    @remove_place(place) for place in @places
    @places = []

  render: ->

    if @places.length == 0
      @no_results.show()
    else
      @no_results.hide()

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


  remove: ->
    @el.remove()

