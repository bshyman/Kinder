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
    @music_genres = ['Hip Hop',"R&B/Soul","Jam Bands", 'House And Techno', "Classical And Jazz", "Ambient And Drone Synth","Ambient And Drone Synth" , "Metal And Hardcore", "Pop Country",  "Disney Radio", "Gospel", "Classic Rock", "Indie Rock", "Ska And Punk"]
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      @music_genres = ['Hip Hop',"R&B/Soul","Jam Bands", 'House And Techno', "Classical And Jazz", "Ambient And Drone Synth","Ambient And Drone Synth" , "Metal And Hardcore", "Pop Country",  "Disney Radio", "Gospel", "Classic Rock", "Indie Rock", "Ska And Punk"]
      render 'edit'
    end
  end

  def dashboard
    if logged_in?
        @user =  User.find(current_user.id)
        @attending = User.find(current_user.id).all_playdates
        @pending = User.find(current_user.id).pending_playdates
        render 'dashboard'
    else
      redirect_to login_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :zipcode, :radius, :email, :password_confirmation, :vaccinate, :religion, :parenting_style, :date_night, :avatar, :gender, :bio, :shopping_prefs, :fav_activities, :music => []).merge(zipcode: 60654, radius: 10)
  end
end
