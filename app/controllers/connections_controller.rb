class ConnectionsController < ApplicationController
  before_action :logged_in_access

  def index
    @connections = current_user.friends
  end

end
