require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
  
  describe "Relations" do
    it { should have_many(:cards) }
  end
  
  describe "Histories" do
    before :each do
      @joe = FactoryGirl.create(:facebook_user)
      @john = FactoryGirl.create(:twitter_user)
      @techniques_card = FactoryGirl.build(:techniques_card)
      @tools_card = FactoryGirl.build(:tools_card)
      @joe.cards << @techniques_card
      @joe.save!
      @john.cards << @tools_card
      @john.save!
    end
    
    it "should return all the history user won and lost" do
      @joe.won(@tools_card)
      expect(History.count).to eq(1)
      expect(@joe.history.count).to eq(1)
      expect(@joe.history.first.won_by).to eq(@joe)
      expect(@joe.history.first.lost_by).to eq(@john)
      
      expect(@john.history.count).to eq(1)
      expect(@john.history.first.won_by).to eq(@joe)
      expect(@john.history.first.lost_by).to eq(@john)
      
      @john.won(@techniques_card)
      expect(History.count).to eq(2)
      expect(@joe.history.count).to eq(2)
      expect(@john.history.count).to eq(2)
    end
  end
end
