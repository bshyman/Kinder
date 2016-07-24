class ConnectionsController < ApplicationController
  before_action :logged_in_access

  def index
    @connections = current_user.friends
  end

  def search
    @user = User.find_by(email: search_params[:search_term])
    p "USER!!!!!!!!!!!!!!!"
    p @user
    if @user
      redirect_to user_path(@user)
    else
      redirect_to :back
      flash[:no_result] = "No Results for #{search_params[:search_term]}"
    end
  end

  def direct
    @other_user = User.find(params[:id])
    current_user.friend_request(@other_user)
    current_user.friendships.last.update(direct_add: true)
    flash[:request_sent] = "Your request has been sent to #{@other_user.username}"
    redirect_to :back
  end

  def search_params
    params.require(:search).permit(:search_term)
  end
end
