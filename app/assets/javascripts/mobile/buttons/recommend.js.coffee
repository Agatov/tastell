class window.RecommendButton extends Button

  onclick: ->
    @waiting_for_response()

    recommendation = new Recommendation()

    $(recommendation).bind("ready", @ready)

    recommendation.recommend()