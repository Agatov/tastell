$ ->

  $(".oauth-link").bind('click',
    ->
      (window.open($(this).attr("href"), "vkontakte", "location,top=0,width=800,height=500")).focus()
      false
  )

  if $("#oauth-success")
    if window.opener
      window.opener.reload()

    window.close()