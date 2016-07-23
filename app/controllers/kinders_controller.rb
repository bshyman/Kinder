class KindersController < ApplicationController
  before_action :logged_in_access

  def index
    kinder = current_user.users_in_proximity
    if current_user.users_in_proximity.empty?
      if current_user.blocked_friends.empty?
        flash[:notice] = "There are no more new parents in the area. Please come back at a later date."
      end
      if !current_user.zipcode
        flash[:zipcode] = "You need to enter zipcode to begin exploring"
      end
      render 'no_kinders'
    else
      redirect_to kinder_path(kinder.sample.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def reject_user
    @rejected_user = User.find(params[:id])
    current_user.friend_request(@rejected_user)
    current_user.accept_request(@rejected_user)
    current_user.block_friend(@rejected_user)
    redirect_to kinders_path
  end

  def accept_user
    @accepted_user = User.find(params[:id])
    if @accepted_user.pending_friends.include?(current_user)
      current_user.accept_request(@accepted_user)
      redirect_to user_path(@accepted_user.id)
    else
      current_user.friend_request(@accepted_user)
      redirect_to kinders_path
    end
  end

  def reset_kinders
    blocked_users = current_user.blocked_friends
    blocked_users.each do |user|
      current_user.unblock_friend(user)
    end
    redirect_to kinders_path
  end
end

