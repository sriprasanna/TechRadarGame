class SessionController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    flash[:notice] = "Logged in succesfully!"
    redirect_to session[:return_to]
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out succesfully!"
    redirect_to session[:return_to]
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
