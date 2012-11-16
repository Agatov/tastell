class window.Recommendation

  constructor: ->
    @recommend_form = $("#recommend-form")
    @recommend_area = $("#recommend-area")
    @repost_form = $("#repost-form")
    @repost_button = $("#repost-button")

    @content = null
    @place_id = null

    @initialize()

  initialize: ->
    _.bindAll(@, "after_recommend")
    @content = @recommend_area.val()
    @place_id = 1

  params: ->
    params = {
      "order[content]": @content,
      "order[place_id]": @place_id
    }
    params

  after_recommend: (data) ->
    $(@).trigger("ready")
    @recommend_form.hide()
    @order_checker = new OrderChecker(data.order_id)
    @repost_button.attr("href", data.url)
    @repost_form.show()
    $("body").animate({scrollTop: 0})

  recommend: ->
    $.post(
      "/orders",
      @params(),
      @after_recommend
    )