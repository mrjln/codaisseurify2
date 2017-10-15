FactoryGirl.define do
  factory :artist do
    name { Faker::Lorem.sentence(1) }
    biography { Faker::Lorem.sentence(10) }
    hometown { Faker::Lorem.sentence(1) }
  end
end
