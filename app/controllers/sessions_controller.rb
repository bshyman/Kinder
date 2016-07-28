class SessionsController < ApplicationController

  def new
    if !logged_in?
      @user = User.new
      render 'new'
    else
      redirect_to dashboard_path(current_user.id)
    end
  end

  def create
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user.id)
    else
      @error = "Invalid username or password"
      render 'new'
    end
  end

  def google_create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if !@user.persisted? && @user.save!
      session[:user_id] = @user.id
      flash[:welcome_notice] = "Welcome! Please fill out the survey form"
      redirect_to edit_user_path(@user.id) and return
    elsif @user.save!
      session[:user_id] = @user.id
    else
      flash[:warning] = "There was an error while trying to authenticate you"
    end
    redirect_to root_path
  end

  def destroy
    session.destroy
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
