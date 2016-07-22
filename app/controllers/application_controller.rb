class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include AuthenticationControllerHelper
  include SessionHelper
  def index
  end
end
