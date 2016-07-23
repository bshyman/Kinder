class PlaydatesController < ApplicationController

  def index
    if logged_in?
      @user = User.find(params[:user_id])
      if current_user.id == @user.id
        @attending = User.find(params[:user_id]).all_playdates
        @pending = User.find(params[:user_id]).pending_playdates
        render 'index'
      else
        redirect_to no_access_path
      end
    else
      redirect_to login_path
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

  def show
    @playdate = Playdate.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @playdate = Playdate.find(params[:id])
    @playdate.destroy
    redirect_to user_playdates_path(@user)
  end

  private
  def playdate_params
    params.require(:playdate).permit(:title, :description, :date,:location).merge(host_id: current_user.id)
  end

end
