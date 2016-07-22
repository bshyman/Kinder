class PlaydatesController < ApplicationController

  def index
    @attending = User.find(params[:user_id]).attending_playdates
    @pending = User.find(params[:user_id]).pending_playdates
  end

  def new
    @playdate = Playdate.new
  end

  def create
    @playdate = Playdate.new(playdate_params)
    if @playdate.save
      redirect_to user_playdates_path(current_user.id)
    else
      render 'new'
    end
  end

  private
  def playdate_params
    params.require(:playdate).permit(:title, :description, :date,:location).merge(host_id: current_user.id)
  end

end
