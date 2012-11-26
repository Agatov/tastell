class PlaceAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  #def default_url
  #"/images/fallback/" + [version_name, "default.jpeg"].compact.join('_')
  #end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [600, 300]
  end

  version :web_thumb do
    process :resize_to_fill => [280, 210]
  end

  version :large do
    process :resize_to_fill => [580, 440]
  end

  version :tall do
    process :resize_to_fill => [280, 440]
  end

  version :wide do
    process :resize_to_fill => [580, 190]
  end

  version :small do
    process :resize_to_fill => [280, 190]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
