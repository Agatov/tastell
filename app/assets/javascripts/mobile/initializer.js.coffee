$ ->

  if $("#find_places")
    window.find_places_button = new FindPlacesButton($("#find_places"))

  if $("#recommend")
    window.recommend_button = new RecommendButton($("#recommend"))



  $("#repost").bind("click",
    ->

      order_checker.initialize()
      $(this).hide()

      (window.open($(this).attr("href"))).focus()
      false
  )