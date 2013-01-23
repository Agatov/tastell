class window.OrderCheckerView

  el_id: '#checker'

  constructor: ->
    @el = $(@el_id)
    @waiting_screen = @el.find(".waiting")
    @success_screen = @el.find(".success")
    @error_screen = @el.find(".error")

    @spin = null

  initialize: ->
    @el.show()
    @show_waiting_screen()

  show_waiting_screen: ->

    @spin = @waiting_screen.find(".spin")
    @spin.spin({
    lines: 8,
    radius: 6
    length: 8,
    width: 2,
    speed: 2
    })

    @waiting_screen.show()

  show_success_screen: ->
    @waiting_screen.hide()
    @success_screen.show()

  show_error_screen: ->