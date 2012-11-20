class PhotoImageUploader < CarrierWave::Uploader::Base
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
  version :list do
    process :resize_to_fill => [140, 140]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
