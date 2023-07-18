FactoryBot.define do
  factory :shelter do
    foster_program { true }
    name {Faker::Company.bs  }
    city { Faker::Address.city }
    rank { rand(1..5) }
  end
end