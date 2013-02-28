class MapApp.Places extends Backbone.Collection
  model: MapApp.Place

  url: ->
    if @models.length == 0
      '/places/list.json'
    else
      page = (@models.length / 4) + 1
      "/places/list.json?page=#{page}"
