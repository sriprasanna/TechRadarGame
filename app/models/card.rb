class Card < ActiveRecord::Base
  self.inheritance_column = nil
  validates_presence_of :uuid, :type, :user_id
  
  belongs_to :user
  
  before_update :create_history
  after_update :update_cards_count
  
  private
  def create_history
    @lost_by = User.find user_id_was
    History.create!(card: self, won_by: user, lost_by: @lost_by)
  end
  
  def update_cards_count
    user.reload
    @lost_by.reload
    user.update cards_count: user.cards.count
    @lost_by.update cards_count: @lost_by.cards.count
  end
end
