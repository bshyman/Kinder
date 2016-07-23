class AttendeesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @attendee = Attendee.new
  end

  def create
    @user = User.find(params[:user_id])
    @invite = Attendee.new(guest_id: guest_params[:guest_id], playdate_id: params[:playdate_id], response: nil)
    if @invite.save
      redirect_to user_playdates_path(@user)
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
    redirect_to user_playdates_path(@user)
  end

  def accept_invite
    @playdate = Playdate.find(params[:playdate_id])
    @user = User.find(params[:user_id])
    @user.accept_invite(@playdate)
    redirect_to user_playdates_path(@user)
  end

  private
  def guest_params
    params.require(:attending).permit(:guest_id)
  end

end
