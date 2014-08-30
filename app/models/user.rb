class User < ActiveRecord::Base
  validates_presence_of :provider, :uid
  validates_uniqueness_of :uid, scope: :provider
  
  has_many :cards
  
  scope :sort_by_ranking, -> { order(cards_count: :desc) }
  
  def won(card)
    card.update user: self
  end
  
  def history
    History.where("won_by_id = ? OR lost_by_id = ?", id, id)
  end
  
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    info = auth_hash[:info]
    user = find_or_create_by(provider: provider, uid: auth_hash[:uid])
    user.update name:   info[:name],
                image:  info[:image],
                url:    info[:urls][provider.humanize]
    user
  end
  
  def rank
    User.where("cards_count > ?", cards_count).count + 1
  end
end
