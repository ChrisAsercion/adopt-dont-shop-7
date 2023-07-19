FactoryBot.define do
  factory :application do
    name { Faker::Name.name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip.to_i }
    description { Faker::Lorem.paragraph }
    status { "In Progress" }
    association :pet_application
  end
end