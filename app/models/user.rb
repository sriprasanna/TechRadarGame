class User < ActiveRecord::Base
  validates_presence_of :provider, :uid
  validates_uniqueness_of :uid, scope: :provider
end
