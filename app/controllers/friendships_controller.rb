class FriendshipsController < ApplicationController
  def index
    @potential_friends = []
    @users = User.all
    @friendships = current_user.friendships

    def potential_friends
      users = User.all
      users.each do |user|
        next if current_user.friendships.exists?(friend_id: user)
        next if current_user == user
        @potential_friends << user
      end
    end
    potential_friends
  end

  def create
    @friendship1 = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship2 = User.find(params[:friend_id]).friendships.build(friend_id: current_user.id)

    if @friendship1.save && @friendship2.save
      flash[:notice] = "Added friend."
      redirect_to friendships_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to friendships_url
    end
  end

  def destroy
    @friend_id = current_user.friendships.find(params[:id]).friend_id
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    @friendship2 = Friendship.find_by(user_id: @friend_id, friend_id: current_user.id)
    @friendship2.destroy

    flash[:notice] = "Removed friendship."
    redirect_to friendships_url
  end
end
