class window.Button

  constructor: (el) ->
    @el = el
    @text = null
    @spin = null

    _.bindAll(@, "onclick", "waiting_for_response", "ready", "fail")
    @el.bind("click", @onclick)

    @initialize()

  initialize: ->


  onclick: ->

  waiting_for_response: ->

    @text = @el.text()
    @el.html(null)

    @spin = $(document.createElement("div"))
    @spin.addClass("spin")
    @el.append(@spin)
    @spin.spin({
      lines: 7,
      radius: 5
    })

  ready: ->
    @el.hide()
    @spin.remove()
    @el.text(@text)

  fail: ->
    @spin.remove()
    @el.text(@text)

