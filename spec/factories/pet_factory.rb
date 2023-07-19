FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    age { Faker::Creature::Dog.age.to_i }
    breed { Faker::Creature::Dog.breed }
    adoptable { Faker::Boolean.boolean }
    association :shelter 
    association :pet_application 
  end
end