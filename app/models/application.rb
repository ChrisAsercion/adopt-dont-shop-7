class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  validates :name, :street_address, :city, :state, :zip, :description, presence: true
  attribute :petscription, :string

  def pet_status(pet_id)
    pet_applications.where(pet_id: pet_id).first
  end

  def pending_pets
    pets.joins(:pet_applications).where(pet_applications: { pet_status: 'Pending' })
  end

  def approved_pets
    pets.joins(:pet_applications).where(pet_applications: { pet_status: 'Accepted' })
  end

  def rejected_pets
    pets.joins(:pet_applications).where(pet_applications: { pet_status: 'Rejected' })
  end
end 