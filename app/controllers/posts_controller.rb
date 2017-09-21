class PostsController < ApplicationController
  before_action :set_post, only: [:upvote, :downvote]

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts_sorted = Post.all.sort_by { |post| post.created_at }.reverse
  end

  def upvote
    @post.liked_by current_user
    redirect_to posts_url
  end

  def downvote
    @post.unliked_by current_user
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
