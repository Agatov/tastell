class window.Comment

  tagName: 'div'
  tagClass: 'comment'
  template: '#comment-template'

  constructor: (data) ->
    @data = data
    @el = $(document.createElement(@tagName))
    @el.addClass(@tagClass)

  render: ->
    template = _.template($(@template).html())
    @el.html(template(@data))
    @