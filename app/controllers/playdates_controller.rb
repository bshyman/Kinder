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
      send_cal_event(@playdate, current_user) if current_user.provider == "google"
      redirect_to new_user_playdate_attendee_path(@user.id, @playdate.id)
    else
      render 'new'
    end
  end

  def show
    @playdate = Playdate.find(params[:id])
    key = ENV['GOOGLE_MAP']
    @google_api_search = "https://www.google.com/maps/embed/v1/search?q=  #{sanitize_search_term(@playdate.location)}&key=#{key}"
  end

  def destroy
    @user = User.find(params[:user_id])
    @playdate = Playdate.find(params[:id])
    flash[:confirm] = "You have deleted #{@playdate.title}"
    @playdate.destroy
    redirect_to user_playdates_path(@user)
  end

  private
  def playdate_params
    params.require(:playdate).permit(:title, :time, :description, :date,:location).merge(host_id: current_user.id)
  end

end
