class AttendeesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @attendee = Attendee.new
  end

  def create
    @user = User.find(params[:user_id])
    @invite = Attendee.new(guest_id: guest_params[:guest_id], playdate_id: params[:playdate_id], response: nil)
    if @invite.save
      flash[:calendar_event] = "We have added this event to your calendar!"
      redirect_to user_playdate_path(@user, params[:playdate_id])
    else
      render 'new'
    end
  end

  def destroy
  end

  def decline_invite
    @playdate = Playdate.find(params[:playdate_id])
    @user = User.find(params[:user_id])
    @user.decline_invite(@playdate)
    redirect_back fallback_location: dashboard_path(@user)
  end

  def accept_invite
    @playdate = Playdate.find(params[:playdate_id])
    @user = User.find(params[:user_id])
    @user.accept_invite(@playdate)
    send_cal_event(@playdate, current_user) if current_user.provider == "google"
    flash[:calendar_event] = "We have added this event to your calendar!"
    redirect_to user_playdate_path(@user.id, @playdate)
  end

  private
  def guest_params
    params.require(:attending).permit(:guest_id)
  end

end
