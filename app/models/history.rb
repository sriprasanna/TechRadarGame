class History < ActiveRecord::Base
  validates_presence_of :won_by_id, :lost_by_id, :card_id
  
  belongs_to :won_by, :class_name => "User"
  belongs_to :lost_by, :class_name => "User"
  belongs_to :card
  
  scope :after, ->(time) { where('created_at > ?', time) }
end
