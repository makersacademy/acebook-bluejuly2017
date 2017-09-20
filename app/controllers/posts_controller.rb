require_relative "../../lib/twitter_api"
class PostsController < ApplicationController
  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts_sorted = Post.all.sort_by { |post| post.created_at }.reverse
    @twitter_trendlist = twitter
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def twitter
    TwitterApi.trendinglist
  end
end
