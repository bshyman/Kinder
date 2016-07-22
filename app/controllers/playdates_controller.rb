class PlaydatesController < ApplicationController

  def index
    @playdates = User.find(params[:user_id]).all_playdates
  end

end
