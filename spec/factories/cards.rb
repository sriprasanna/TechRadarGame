# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :techniques_card, class: Card do
    uuid SecureRandom.uuid
    type "Techniques"
  end
  
  factory :tools_card, class: Card do
    uuid SecureRandom.uuid
    type "Tools"
  end
  
  factory :platforms_card, class: Card do
    uuid SecureRandom.uuid
    type "Platforms"
  end
  
  factory :languages_frameworks_card, class: Card do
    uuid SecureRandom.uuid
    type "Languages & Framerworks"
  end
end
