class window.Button

  constructor: (el) ->
    @el = el
    @text = null
    @spin = null

    _.bindAll(@, "onclick", "waiting_for_response", "ready")
    @el.bind("click", @onclick)

    @initialize()

  initialize: ->


  onclick: ->
    console.log("It clicks me!!")

  waiting_for_response: ->

    @text = @el.text()
    @el.html(null)

    @spin = $(document.createElement("div"))
    @spin.addClass("spin")
    @el.append(spin)
    @spin.spin({
      lines: 7,
      radius: 5
    })

    #@el.addClass("waiting")

  ready: ->
    @el.hide()
    @spin.remove()
    @el.text(@text)

