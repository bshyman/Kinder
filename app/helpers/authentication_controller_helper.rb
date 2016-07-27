module AuthenticationControllerHelper

  def authorized?(object)
    #must pass something like: @review.reviewer
    logged_in? && object.id == current_user.id
  end

  def restricted_access(object)
    redirect_to no_access_path unless authorized?(object)
  end

  def logged_in_access
    redirect_to no_access_path unless logged_in?
  end
end
