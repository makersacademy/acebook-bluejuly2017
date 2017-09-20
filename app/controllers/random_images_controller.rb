class RandomImagesController < ApplicationController
  before_action :set_random_image, only: [:show, :edit, :update, :destroy]

  # GET /random_images
  # GET /random_images.json
  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_random_image
      @random_image = RandomImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def random_image_params
      params.fetch(:random_image, {})
    end
end
