class RandomImagesController < ApplicationController

  IMAGE_PATH = "app/assets/images"

  def index
    images = get_images
    @random_image = random_image(images)
  end

  def show
    redirect_to '/random_images'
  end

  private

  def random_image(image_array)
    index = rand(0...image_array.length)
    image_array[index]
  end

  def get_images
    images = []
    Dir.foreach(IMAGE_PATH) do |item|
      next if valid_path?(item) && !image?(item)
      images << item
    end
    images
  end

  def valid_path?(item)
    item != '.' || item != '..'
  end

  def image?(item)
    item.include?('.jpg') || item.include?('.jpeg') || item.include?('.png')
  end
end
