class PlaydatesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if logged_in?
      restricted_access(@user)
      @user = User.find(params[:user_id])
      @attending = User.find(params[:user_id]).all_playdates
      @pending = User.find(params[:user_id]).pending_playdates
    else
      redirect_to root_path
    end
  end

  def new
    @playdate = Playdate.new
  end

  def create
    @user = User.find(params[:user_id])
    @playdate = Playdate.new(playdate_params)
    if @playdate.save
      redirect_to new_user_playdate_attendee_path(@user.id, @playdate.id)
    else
      render 'new'
    end
  end

  private
  def playdate_params
    params.require(:playdate).permit(:title, :description, :date,:location).merge(host_id: current_user.id)
  end

end
