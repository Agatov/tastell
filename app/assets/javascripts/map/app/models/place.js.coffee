class MapApp.Place extends Backbone.Model

  placemark: null

  initialize: ->
    console.log('place model initialized')
    yandex_map.add_placemark(@)

  latlng: ->
    [@.get('latitude'), @.get('longitude')]