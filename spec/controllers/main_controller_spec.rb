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
  
  describe "Status board" do
    before do
      30.times do |count|
        user = FactoryGirl.create(:facebook_user, uid: SecureRandom.uuid)
        user.update cards_count: count
      end
    end
    it "should render the status board with the top 20 users" do
      get :status_board
      ranks = assigns(:users).collect(&:rank)
      expect(ranks).to eq((1..20).to_a)
    end
  end
  
  describe "Timeline" do
    before do
      @joe = FactoryGirl.create(:facebook_user)
      @john = FactoryGirl.create(:twitter_user)
      @techniques_card = FactoryGirl.build(:techniques_card)
      @tools_card = FactoryGirl.build(:tools_card)
      @joe.cards << @techniques_card
      @joe.save!
      @john.cards << @tools_card
      @john.save!
      @joe.won(@techniques_card)
    end
    
    it "should render the timeline page" do
      get :timeline
      expect(assigns(:history).count).to eq(1)
    end
    
    it "should render template with the history after given time" do
      History.first.update created_at: 2.days.ago
      @john.won(@techniques_card)
      get :timeline_updates, after: 1.day.ago
      expect(assigns(:history)).to eq([History.first])
      expect(response).to render_template("main/_history")
    end
  end
end
