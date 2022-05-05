class ApplicationController < ActionController::Base    

  def logged_in?
    session[:user_id] 
  end    

  def require_login
    if !logged_in? 
    redirect_to login_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if 
    session[:user_id]
  end
end
end
