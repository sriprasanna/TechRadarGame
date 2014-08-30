class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_referrer
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user
  end
  
  private
  def set_referrer
    session[:return_to] ||= request.referer
  end
  
  def logged_in?
    not session[:user_id].nil?
  end
end
