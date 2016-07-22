class KindersController < ApplicationController
  def index
    logged_in_access
    kinder = current_user.users_in_proximity
    redirect_to kinder_path(kinder.sample.id)
  end

  def show
    logged_in_access
    @user = User.find(params[:id])
  end

  def reject
    logged_in_access
    @user = User.find(params[:id])

  end

  def accept
    logged_in_access

  end
end

