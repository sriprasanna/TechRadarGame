require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Validations" do
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
end
