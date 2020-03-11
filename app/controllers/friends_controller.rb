class FriendsController < ApplicationController
  def find_friends
    @users = User.where.not(id: current_user.id)
  end

  def add_friends
    current_user.friend_request(User.find(params[:id]))
    redirect_to find_friends_path
  end

  def accept_friends
    current_user.accept_request(User.find(params[:id]))
    redirect_to dashboard_path
  end

  def block_friends
    current_user.block_friend(User.find(params[:id]))
    redirect_to dashboard_path
  end

  def decline_friends
    current_user.block_friend(User.find(params[:id]))
    redirect_to dashboard_path
  end

  def remove_friends
    current_user.block_friend(User.find(params[:id]))
    redirect_to dashboard_path
  end
end
