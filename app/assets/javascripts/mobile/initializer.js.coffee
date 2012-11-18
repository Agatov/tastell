$ ->

  if $("#find_places")
    window.find_places_button = new FindPlacesButton($("#find_places"))

  if $("#recommend")
    window.recommend_button = new RecommendButton($("#recommend"))

  if $("#repost")
    window.repost_button = new RepostButton($("#repost"))