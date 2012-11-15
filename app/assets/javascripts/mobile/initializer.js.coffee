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

          $("#repost-form").find(".repost-button").attr("href", data.url)

          $("#repost-form").show()
          $("body").animate({scrollTop: 0})


      )
  )