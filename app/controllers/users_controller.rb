class UsersController < ApplicationController
  def show
    @user = current_user
    # @posts_sorted = Post.all.sort_by { |post| post.created_at }.reverse
  end
end
