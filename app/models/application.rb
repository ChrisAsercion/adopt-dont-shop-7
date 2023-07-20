class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  validates :name, :street_address, :city, :state, :zip, :description, presence: true
  attribute :petscription, :string

  def pet_status(pet_id)
    pet_applications.where(pet_id: pet_id).first
  end

  def pending_pets
    pets.where(applications_pets: { pet_status: 'pending' })
  end

  def approved_pets
    pets.where(applications_pets: { pet_status: 'accepted' })
  end

  def rejected_pets
    pets.where(applications_pets: { pet_status: 'rejected' })
  end
end 