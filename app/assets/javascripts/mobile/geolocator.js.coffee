class window.Geolocator

  constructor: ->
    @latitude = null
    @longitude = null
    @error = null

  initialize: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(
        (position) =>
          @latitude = position.coords.latitude
          @longitude = position.coords.longitude

          $(@).trigger("latlng_ready")

          console.log("#{position.coords.latitude} - #{position.coords.longitude}")

        (error) =>

          @error = error

          errors = {
            1: 'Нет прав доступа',
            2: 'Местоположение невозможно определить',
            3: 'Таймаут соединения'
          }

          console.log("Ошибка #{errors[error.code]} (#{error.code})")

        {
          enableHighAccuracy: true,
          timeout: 15000,
          maximumAge: 0
        }
      )

  latlng: ->
    if @latitude and @longitude
      "#{@latitude},#{@longitude}"
    else
      false
