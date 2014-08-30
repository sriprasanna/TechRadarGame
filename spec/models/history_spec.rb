require 'rails_helper'

RSpec.describe History, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:won_by_id) }
    it { should validate_presence_of(:lost_by_id) }
    it { should validate_presence_of(:card_id) }
  end
  
  describe "Relations" do
    it { should belong_to(:won_by) }
    it { should belong_to(:lost_by) }
    it { should belong_to(:card) }
  end
end
