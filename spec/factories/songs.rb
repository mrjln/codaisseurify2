FactoryGirl.define do
  factory :song do
    titel   {Faker::Lorem.sentence(1) }
    year      1900
    album   {Faker::Lorem.sentence(1) }
  end
end
