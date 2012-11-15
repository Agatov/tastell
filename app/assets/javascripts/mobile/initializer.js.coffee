$ ->


  $("#recommend").bind("click",
    ->
      $.post("/orders",
        {
          "order[content]": $("#recommend-area").val(),
          "order[place_id]": 1
        },
        (data) =>
          $("#recommend-form").hide()

          window.order_checker = new OrderChecker(data.order_id)

          $("#repost-form").find(".repost-button").attr("href", data.url)

          $("#repost-form").show()
          $("body").animate({scrollTop: 0})


      )
  )



  $("#repost").bind("click",
    ->

      order_checker.initialize()
      $(this).hide()

      (window.open($(this).attr("href"))).focus()
      false
  )