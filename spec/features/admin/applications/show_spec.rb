require 'rails_helper'

RSpec.describe "Admin Applications" do
  before :each do
    @shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @pet = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @pet2 = Pet.create!(name: "Scrappy", age: 1, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @application_1 = Application.create!(name: "Topher B.", street_address: "101 W. East St.", city: "Los Angeles", state: "CA", zip: "90210", description: "I have home", petscription: "I have scooby snacks", status: "In Progress")
    @application_2 = Application.create!(name: "Topher C.", street_address: "102 W. East St.", city: "Los Angeles", state: "CA", zip: "90210", description: "I have 2 homes", petscription: "I have snacks", status: "In Progress")
    PetApplication.create!(pet_status: "Pending", pet_id: @pet.id, application_id: @application_1.id)
    PetApplication.create!(pet_status: "Pending", pet_id: @pet.id, application_id: @application_2.id)
  end
  # User Story 12 & 13
  describe "admin visits the admin show page" do
    it "it shows all pets in an application" do
      visit "/admin/applications/#{@application_1.id}"
      # save_and_open_page
      expect(page).to have_content(@application_1.name)
      expect(page).to have_content(@pet.name)
      expect(page).to have_button("Approve")
      click_button("Approve")
      # save_and_open_page
      expect(current_path).to eq("/admin/applications/#{@application_1.id}")
      expect(page).to have_content("Approved Pets")
      expect(page).to_not have_button("Approve")
    end

    #  User Story 14
    it "admin can approve the same pet on two applications" do
      visit "/admin/applications/#{@application_1.id}"
      click_button("Approve")
      # save_and_open_page
      expect(current_path).to eq("/admin/applications/#{@application_1.id}")
      expect(page).to have_content("Approved Pets")

      visit "/admin/applications/#{@application_2.id}"
      click_button("Approve")
      # save_and_open_page
      expect(current_path).to eq("/admin/applications/#{@application_2.id}")
      expect(page).to have_content("Approved Pets")

    end
  end
end