class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:welcome_notice] = "Welcome! Please fill out the survey form"
      redirect_to edit_user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @children = @user.children
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def dashboard
  end 

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation, :vaccine, :religion, :parenting_style, :date_night, :shopping_prefs, :fav_activities, :music)
  end
end
