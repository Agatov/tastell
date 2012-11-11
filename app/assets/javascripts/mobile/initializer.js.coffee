$ ->
  $("#recommend").bind("click",
    ->
      $.post("/orders",
        {
          content: $("#recommend-area").val()
        },
        (data) =>
          $("#recommend-form").hide()
          $("#repost-form").show()
          $("body").animate({scrollTop: 0})
      )
  )