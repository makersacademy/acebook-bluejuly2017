class RandomImagesController < ApplicationController
  # before_action :set_random_image, only: [:show, :edit, :update, :destroy]

  # GET /random_images
  # GET /random_images.json
  def index
    p path = "app/assets/images"
    images = []

    Dir.foreach(path) do |item|
      next if valid_path?(item) && !image?(item)
      images << item
    end
    index = rand(0...images.length)
    this_image = images[index]
    @random_image_html = this_image
  end

  private

  def valid_path?(item)
    item != '.' || item != '..'
  end

  def image?(item)
    item.include?('.jpg') || item.include?('.jpeg') || item.include?('.png')
  end

end
