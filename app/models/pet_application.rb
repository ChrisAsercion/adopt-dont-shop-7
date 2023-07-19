class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  attribute :pet_status, :string
end