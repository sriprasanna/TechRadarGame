require 'rails_helper'

RSpec.describe Card, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:uuid) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:user_id) }
  end
  
  describe "Relations" do
    it { should belong_to(:user) }
  end
end
