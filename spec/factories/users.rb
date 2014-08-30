# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facebook_user, class: User  do
    provider "facebook"
    uid SecureRandom.uuid
    name "Joe Bloggs"
    image "http://graph.facebook.com/1234567/picture?type=square"
    url "http://www.facebook.com/jbloggs"
  end
  
  factory :twitter_user, class: User  do
    provider "facebook"
    uid SecureRandom.uuid
    name "John Q Public"
    image "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
    url "https://twitter.com/johnqpublic"
  end
end
