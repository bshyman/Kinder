class AttendeesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @attendee = Attendee.new
  end

  def create
    @user = User.find(params[:user_id])
    @invite = @user.create_invite(guest_params[:guest_id], params[:playdate_id])
    if @invite.save
      redirect_to user_playdates_path(@user)
    else
      render 'new'
    end
  end

  private
  def guest_params
    params.require(:attending).permit(:guest_id)
  end

end
