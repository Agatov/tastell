$ ->
  $("#submit-order").bind('click', ->
    $.post(
      '/orders.json',
      {
        'order[content]': $("#order-text").val()
        'order[place_id]': $("#place-id").val()
        'order[table_number]': $("#table-number").val()
      },
      (data) ->
        if data.status == 'ok'
          $("#comment-form").hide()
          $("#vk-share-screen").show()
          (window.open(data.url, "vkontakte", "location,top=0,width=800,height=500")).focus()

          order_checker = new OrderChecker(data.order_id)
          order_checker.initialize()



    )
  )