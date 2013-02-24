//= require map/jquery-1.9.1
//= require map/underscore
//= require map/json2
//= require map/backbone
//= require map/backbone.marionette
//= require hamlcoffee


//= require map/yandex_map
//= require map/map_app

//= require_tree ../templates

// Сначала грузим вьюхи, затем модели, затем коллекции. И только так.
//= require_tree ./map/app/views
//= require_tree ./map/app/models
//= require_tree ./map/app/collections

//= require map/initializer