class FriendsController < ApplicationController
  def find_friends
    if params[:query].present?
      @users = User.search_by_user(params[:query])
    else
      @users = User.where.not(id: current_user.id)
    end
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
