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

          $("#share-link").attr('href', data.url)
          $("#share-link").attr('order_id', data.order_id)
    )
  )

  $("#share-link").bind('click', ->
    $("#vk-share-screen").hide()

    (window.open($(this).attr('href'), "vkontakte", "location,top=0,width=800,height=500")).focus()

    order_checker = new OrderChecker($(this).attr('order_id'))
    order_checker.initialize()

    false
  )