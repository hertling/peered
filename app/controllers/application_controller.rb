class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def dashboard
  end

  def current_user
    @current_user ||= user_from_session
  end  

  def current_user=(user)
    @current_user = user
  end

private
  def user_from_session
    session[:user_id]=nil if params[:reset_id]=="true"
    User.find(session[:user_id]) if session[:user_id]
  end
end
