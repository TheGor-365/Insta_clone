class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  #storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # version :thumb do
  #   process resize_to_fill: [300,300]
  # end

  # def scale(width, height)
  #   # do something
  # end

  # def content_type_whitelist
  #   /image\//
  # end

  # def filename
  #   "something.jpg" if original_filename
  # end
end
