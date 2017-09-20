class FriendshipsController < ApplicationController

  def create

    def friendship_exists
      current_user.friendships.exists?(friend_id: params[:friend_id])
    end

    def friending_self
      current_user.id.to_s == params[:friend_id].to_s
    end

    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if !friendship_exists && !friending_self && @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to users_url
  end
end
