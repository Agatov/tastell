class window.RepostButton extends Button

  onclick: ->
    $("#repost-form").hide()
    @el.hide()

    @order_checker = new OrderChecker(@el.attr("order-id"))
    @order_checker.initialize()

    (window.open(@el.attr("href"))).focus()
    false