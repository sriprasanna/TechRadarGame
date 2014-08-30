require 'rails_helper'

RSpec.describe History, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:won_by) }
    it { should validate_presence_of(:lost_by) }
    it { should validate_presence_of(:card) }
  end
end
