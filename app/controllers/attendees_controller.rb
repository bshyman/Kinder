class AttendeesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @attendee = Attendee.new
  end

  def create
    @user = User.find(params[:user_id])
    if guest_params["guest_id"] == [" "]
      @attendee = Attendee.new
      flash[:warning] = "You must select atleast one guest"
      render 'new'
    else
      invited = guest_params["guest_id"]
      invited.delete_if { |g| g == " " }
      guests = []
      invited.each do |g|
        guests << User.find(g)
      end
      guests.each do |g|
        Attendee.create(guest_id: g.id, playdate_id: params[:playdate_id], response: nil)
      end
      flash[:calendar_event] = "We have added this event to your calendar!"
      redirect_to user_playdate_path(@user, params[:playdate_id])
    end
  end

  def destroy
  end

  def decline_invite
    @playdate = Playdate.find(params[:playdate_id])
    @user = User.find(params[:user_id])
    flash[:confirm] = "You have declined #{@playdate.title}"
    @user.decline_invite(@playdate)
    redirect_to user_playdates_path(@user.id)
  end

  def accept_invite
    @playdate = Playdate.find(params[:playdate_id])
    @user = User.find(params[:user_id])
    @user.accept_invite(@playdate)
    if current_user.provider == "google"
      send_cal_event(@playdate, current_user)
      flash[:confirm] = "We have added this event to your calendar!"
    else
      flash[:confirm] = "You have accepted this playdate"
    end
    redirect_to user_playdate_path(@user.id, @playdate)
  end

  private
  def guest_params
    params.require(:attending).permit(:guest_id  => [])
  end

end
