class window.OrderChecker

  timeout: 3
  view_el = "#checker"

  constructor: (id) ->
    @id = id
    @valid = false
    @interval_id = null
    @checks_num = 0

    @view = new OrderCheckerView($(view_el))

  initialize: ->
    @view.initialize()
    @start()

  start: ->
    @interval_id = setInterval(
      =>
        @check()
      @timeout * 1000
    )

  stop: ->
    clearInterval(@interval_id)
    @checks_num = 0

  check_url: ->
    "/orders/#{@id}/check"

  check: ->
    @checks_num += 1
    console.log("checking... (#{@checks_num})")

    $.get(
      @check_url(),
      (data) =>
        if data.status == 'success'
          @view.show_success_screen()
          @stop()
        else data.status == 'not_found'
          # Продолжаем, хуле
      )


class OrderCheckerView

  constructor: (el) ->
    @el = el

    @waiting_screen = @el.find(".waiting")
    @success_screen = @el.find(".success")
    @error_screen = @el.find(".error")


  initialize: ->
    @el.show()
    @show_waiting_screen()

  show_waiting_screen: ->
    @waiting_screen.show()

  show_success_screen: ->
    @waiting_screen.hide()
    @success_screen.show()

  show_error_screen: ->

