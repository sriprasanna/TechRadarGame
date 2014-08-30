class Card < ActiveRecord::Base
  self.inheritance_column = nil
  validates_presence_of :uuid, :type, :user_id
  
  belongs_to :user
  
  before_update :create_history
  
  private
  def create_history
    lost_by = User.find user_id_was
    History.create!(card: self, won_by: user, lost_by: lost_by)
  end
end
