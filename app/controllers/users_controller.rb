class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_playdates_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @children = @user.children
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
end
