class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  include AuthenticationControllerHelper
  include UserHelper
  include KinderHelper
  include GoogleCalendarHelpers

  def index
  end
end
