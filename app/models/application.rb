class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications
  # belongs_to :shelter

  validates :name, :street_address, :city, :state, :zip, :description, presence: true
  attribute :petscription, :string
end 