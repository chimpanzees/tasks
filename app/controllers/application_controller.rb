class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) || :false
  end
  
  def logged_in?
    current_user.is_a?(User)
  end
  
  def login_required
    unless logged_in?
      redirect_to login_path, :alert => "You must be logged in to access this path."
    end
  end
  
  helper_method :logged_in?, :current_user
  
end
