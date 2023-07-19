FactoryBot.define do
  factory :pet_application do
    association :pet 
    association :application 
  end
end