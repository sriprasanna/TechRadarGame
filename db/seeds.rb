# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

thoughtworks = User.new(name: "ThoughtWorks", provider: "ThoughtWorks", uid: "uid", url: "http://thoughtworks.com", image: "http://www.thoughtworks.com/imgs/tw-logo.png")
thoughtworks.save!
card_types = ["Techniques", "Tools", "Platforms", "Languages & Framerworks"]

card_types.each do |card_type|
  100.times do
    thoughtworks.cards << Card.new(uuid: SecureRandom.uuid, type: card_type)
  end
end
thoughtworks.cards_count = thoughtworks.cards.count
thoughtworks.save!