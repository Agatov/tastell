class window.OrderChecker

  timeout: 3

  constructor: (id) ->
    @id = id
    @valid = false
    @interval_id = null
    @checks_num = 0

    @view = new OrderCheckerView()

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

    $.get(
      @check_url(),
    (data) =>
      if data.status == 'success'
        @view.show_success_screen()
        @stop()
      else data.status == 'not_found'
      # Продолжаем, хуле
    )