class MapApp.MapPlaces extends Backbone.Collection
  model: MapApp.MapPlace
  url:  '/places/map.json'