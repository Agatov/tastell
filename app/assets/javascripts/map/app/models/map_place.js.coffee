class MapApp.MapPlace extends Backbone.Model

  placemark: null

  initialize: ->
    console.log('place model initialized')
    yandex_map.add_placemark(@)

  latlng: ->
    [@.get('latitude'), @.get('longitude')]

  lefter_laglng: ->
    [@.get('latitude'), @.get('longitude') + 0.009]

  open_balloon: ->
    @placemark.balloon.open()

  close_balloon: ->
    @placemark.balloon.close()