class LatLng

  attr_accessor :string_value
  attr_accessor :float_value

  def initialize(latlng)
    self.string_value = latlng
  end

  def to_f
    return nil if string_value.nil?

    latlng = string_value.split(',')
    latitude = latlng.first.to_f
    longitude = latlng.last.to_f
    self.float_value = [latitude, longitude]
  end

  def to_radiance
    return nil if string_value.nil?
    Geocoder::Calculations.to_radians(self.to_f)
  end
end