class SessionsController < ApplicationController
  
  def create
    auth = AtechIdentity::Authentication.new(params[:username], params[:password])
    if auth.success? && auth.user.admin?
      local_user = User.find_or_create_by_atech_identity(auth.user)
      session[:user_id] = local_user.id
      redirect_to root_path
    else
      redirect_to login_path, :alert => "Your username and/or password was incorrect"
    end
  end
  
  def destroy
    reset_session
    redirect_to login_path, :alert => "You have been logged out successfully."
  end
  
end
