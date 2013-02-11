class window.CommentsList

  constructor: (place_id) ->
    @place_id = place_id
    @el = $("#comments-list")
    @page = 1
    @comments_on_page = 20
    @comments = []

    @initialize()


  initialize: ->
    @get_list()


  get_list: ->
    $.get(
      "/places/#{@place_id}/comments.json?offset=0",
      (data) =>
        @add_comment(comment) for comment in data.orders
    )

  add_comment: (data) ->
    comment = new Comment(data)
    @comments.push(comment)
    @el.append(comment.render().el)

