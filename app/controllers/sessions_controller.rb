class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password] )
      session[:user_id] = @user.id
      redirect_to user_playdates_path(@user.id)
    else
      @error = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def forbidden
    render '404'
  end

 private
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
