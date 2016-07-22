class PlaydatesController < ApplicationController

  def index
    @attending = User.find(params[:user_id]).attending_playdates
    @pending = User.find(params[:user_id]).pending_playdates
  end

end
