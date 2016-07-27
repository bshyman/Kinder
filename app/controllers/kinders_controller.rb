class KindersController < ApplicationController
  before_action :logged_in_access

  def index
    kinder = current_user.users_in_proximity
    kinder = filter_by(session[:narrow], kinder)
    kinder
    if kinder.empty?
      if current_user.blocked_friends.empty?
        flash[:notice] = "There are no more new parents in the area. Please come back at a later date."
      end
      if !current_user.zipcode
        flash[:zipcode] = "You need to enter zipcode to begin exploring"
      end
      @user = current_user
      render 'no_kinders'
    else
      redirect_to kinder_path(kinder.sample.id)
    end
  end

  def filter
    if params[:vaccinate] == "true"
      params[:vaccinate] = true
    elsif params[:vaccinate] == "false"
      params[:vaccinate] = false
    end

    session[:narrow] = {}
    session[:narrow]["gender"] = params[:gender] if params[:gender] != ''
    session[:narrow]["vaccinate"] = params[:vaccinate] if params[:vaccinate] != ''
    redirect_to kinders_path
  end

  def delete_filter
    session.delete(:narrow)
    redirect_to kinders_path
  end

  def show
    @user = User.find(params[:id])
  end

  def reject_user
    @rejected_user = User.find(params[:id])
    current_user.friend_request(@rejected_user)
    current_user.accept_request(@rejected_user)
    current_user.block_friend(@rejected_user)
    if request.xhr?

    else
      redirect_to kinders_path
    end
  end

  def accept_user
    @accepted_user = User.find(params[:id])
    if @accepted_user.pending_friends.include?(current_user)
      current_user.accept_request(@accepted_user)
      flash[:notice] = "You've made a connection! Click on the 'Schedule Playdate' button to set up a playdate or 'Send Message' to discuss your preferred times and locations."
      if request.xhr?
        render user_path(@accepted_user.id), layout:false
      else
        redirect_to user_path(@accepted_user.id)
      end
    else
      current_user.friend_request(@accepted_user)
      if request.xhr?
        render "index", layout:false
      else
        redirect_to kinders_path
      end
    end
  end

  def reset_kinders
    blocked_users = current_user.blocked_friends
    blocked_users.each do |user|
      current_user.unblock_friend(user)
    end
    redirect_to kinders_path
  end

  def filter_params
    params.permit(:gender, :vaccinate)
  end
end

