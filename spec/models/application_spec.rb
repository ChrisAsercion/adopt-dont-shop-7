require "rails_helper"

RSpec.describe Application, type: :model do
  
  describe "relationships" do
    it {should have_many(:pets)}
    it {should belong_to(:shelter)}
  end
end

