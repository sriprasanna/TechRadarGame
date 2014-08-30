class History < ActiveRecord::Base
  validates_presence_of :won_by, :lost_by, :card
end
