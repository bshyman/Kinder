class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  include AuthenticationControllerHelper

  def index
  end

end
