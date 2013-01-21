$ ->
  $("#submit-order").bind('click', ->
    $.post(
      '/orders.json',
      {
        'order[content]': $("#order-text").val()
        'order[place_id]': $("#place-id").val()
      },
      (data) ->
        if data.status == 'ok'
          $("#comment-form").hide()
          $("#vk-share-screen").show()
          (window.open(data.url, "vkontakte", "location,top=0")).focus()



    )
  )