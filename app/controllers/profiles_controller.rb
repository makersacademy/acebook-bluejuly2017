class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(post_params)
    redirect_to profiles_url
  end

  def index
    @profiles = Profile.all
  end

  private

  def post_params
    params.require(:profile).permit(:name)
  end
end
