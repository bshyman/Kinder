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
    render text: request.env['omniauth.auth'].to_yaml
    # begin
    #   @user = User.from_omniauth(request.env['omniauth.auth'])
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome, #{@user.name}!"
    # rescue
    #   flash[:warning] = "There was an error while trying to authenticate you..."
    # end
    # redirect_to root_path
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
