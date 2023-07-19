require "rails_helper"

RSpec.describe PetApplication, type: :model do
  describe "relationships" do
    it { should belong_to(:application) }
    it { should belong_to(:pet) }
  end

  describe "validations" do
    it { should validate_presence_of(:application) }
    it { should validate_presence_of(:pet) }
    it { should validate_presence_of(:pet_status) }
  end
end