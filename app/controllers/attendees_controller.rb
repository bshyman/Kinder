class AttendeesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @attendee = Attendee.new
  end

  def create
    @user = User.find(params[:user_id])
    @guest = User.find(guest_params[:guest_id])
    @playdate = Playdate.find(params[:playdate_id])
    @user.create_invite(@guest, @playdate)
  end

  private
  def guest_params
    params.require(:attending).permit(:guest_id)
  end

end
