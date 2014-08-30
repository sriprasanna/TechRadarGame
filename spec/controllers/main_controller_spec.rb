require 'rails_helper'

RSpec.describe MainController, :type => :controller do
  describe "Won card" do
    before do
      @joe = FactoryGirl.create(:facebook_user)
      @john = FactoryGirl.create(:twitter_user)
      @techniques_card = FactoryGirl.build(:techniques_card)
      @tools_card = FactoryGirl.build(:tools_card)
      @joe.cards << @techniques_card
      @joe.save!
      @john.cards << @tools_card
      @john.save!
    end
    
    it "should redirect to login page if the user is not logged in" do
      get :won_card, uuid: @tools_card.uuid
      expect(response).to redirect_to "/login"
      expect(flash[:notice]).to match(/^Please log in to continue./)
    end
    
    it "should change the owner of the card" do
      session[:user_id] = @joe.id
      get :won_card, uuid: @tools_card.uuid
      expect(@joe.cards.count).to eq(2)
      expect(@joe.history.count).to eq(1)
      expect(response).to redirect_to "/"
      expect(flash[:notice]).to match("You have won the card from <a href=\"/profile/#{@john.id}\">John Q Public</a>!")
    end
  end
  
  describe "Login" do
    it "should render login page" do
      get :login
      expect(response).to render_template(:login)
    end
  end
  
  describe "Profile" do
    it "should render profile page for an user" do
      user = FactoryGirl.create(:facebook_user)
      get :profile, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end
end
