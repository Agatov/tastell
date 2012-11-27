Rails.application.config.middleware.use OmniAuth::Builder do

  provider :vkontakte, '3036832', 'd3kg1Zf7gQ7wd7Lbbs6R', {
      scope: "notify,friends,photos,offline"
  }
end