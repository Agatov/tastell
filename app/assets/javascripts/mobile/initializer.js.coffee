$ ->

  $("body").animate({scrollTop: 0})

  if $("#find_places")
    window.find_places_button = new FindPlacesButton($("#find_places"))

  if $("#recommend")
    window.recommend_button = new RecommendButton($("#recommend"))

  if $("#repost")
    window.repost_button = new RepostButton($("#repost"))

  if $("#places-list").size() == 1
    window.pl = new PlacesList()
    pl.initialize()