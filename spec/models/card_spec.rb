require 'rails_helper'

RSpec.describe Card, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:uuid) }
    it { should validate_presence_of(:type) }
  end
end
