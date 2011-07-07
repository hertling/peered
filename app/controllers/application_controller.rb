class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def dashboard
  end

private
  def current_user
    session[:user_id]=nil if params[:reset_id]=="true"
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end  

end
