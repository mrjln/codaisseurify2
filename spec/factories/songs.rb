FactoryGirl.define do
  factory :song do
    titel   {Faker::Lorem.sentence(1) }
    year     1234
    album   {Faker::Lorem.sentence(1) }
  end
end
