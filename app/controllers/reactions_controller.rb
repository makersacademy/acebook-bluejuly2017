class ReactionsController < ApplicationController
  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = Reaction.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
