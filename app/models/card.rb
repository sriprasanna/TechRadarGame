class Card < ActiveRecord::Base
  validates_presence_of :uuid, :type
end
