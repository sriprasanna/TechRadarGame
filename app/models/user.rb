class User < ActiveRecord::Base
  validates_presence_of :provider, :uid
  validates_uniqueness_of :uid, scope: :provider
  
  has_many :cards
  
  def won(card)
    card.update user: self
  end
  
  def history
    History.where("won_by_id = ? OR lost_by_id = ?", id, id)
  end
end
