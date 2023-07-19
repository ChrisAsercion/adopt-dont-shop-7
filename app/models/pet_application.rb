class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  validates :pet_status, presence: true
end