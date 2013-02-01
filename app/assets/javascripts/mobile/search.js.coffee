class window.Search

  search_field_id: '#search-input'

  constructor: ->
    @search_field = $(@search_field_id)
    @value = ''

    @initialize()

  initialize: ->
    @search_field.bind('keydown', =>
      @value = @search_field.val()
      $(@).trigger('value_changed')
    )

