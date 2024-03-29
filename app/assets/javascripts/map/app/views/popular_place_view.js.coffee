class MapApp.PopularPlaceView extends Backbone.Marionette.ItemView
  template: 'places/popular_place'
  className: 'place'

  events: {
    'mouseenter': 'open_balloon',
    'mouseleave': 'close_balloon'
  }

  open_balloon: ->
    @model.open_balloon()
    yandex_map.map.setCenter(@model.lefter_laglng())

  close_balloon: ->
    @model.close_balloon()