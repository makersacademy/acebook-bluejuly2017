class NewshineythingController < ApplicationController

  def index
    @message = "Go Pet a lama" 
  end

  def post_params
    puts "heeey"
  end
end
