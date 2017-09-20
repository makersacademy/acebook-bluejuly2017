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
    puts this_image
    @random_image_html = this_image
  end

  private

    def valid_path?(item)
      item != '.' or item != '..'
    end

    def image?(item)
      item.include?('.jpg') || item.include?('.jpeg') || item.include?('.png')
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_random_image
      @random_image = RandomImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def random_image_params
      params.fetch(:random_image, {})
    end
end