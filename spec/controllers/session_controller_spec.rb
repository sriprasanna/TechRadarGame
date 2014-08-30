require 'rails_helper'

RSpec.describe SessionController, :type => :controller do  
  describe "Create" do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    end
    
    it "should create a session for the user" do
      session[:return_to] = "/return_to"
      get :create, provider: "twitter"
      expect(response).to redirect_to session[:return_to]
      user = User.where(provider: "twitter", uid: "UUID").first
      expect(controller.current_user).to eq(user)
      expect(flash[:notice]).to match(/^Logged in succesfully!/)
    end
  end
  
  describe "Destroy" do
    it "should destroy the session for the user" do
      session[:user_id] = 123
      session[:return_to] = "/return_to"
      get :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to session[:return_to]
      expect(flash[:notice]).to match(/^Logged out succesfully!/)
    end
  end
end
