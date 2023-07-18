require 'rails_helper'

RSpec.describe 'Admin Shelter Show Page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @shelter2 = Shelter.create!(name: "Pets Galore", city: "Sacramento CA", foster_program: false, rank: 10)
    @shelter3 = Shelter.create!(name: "Dog Pound", city: "San Francisco CA", foster_program: false, rank: 11)
    @shelter4 = Shelter.create!(name: "Cat Pound", city: "Culver CA", foster_program: false, rank: 12)
    @pet = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter1.id)
    @application1 = Application.create!(name: "Topher C.", street_address: "103 W. East St.", city: "Los Angeles", state: "CA", zip: "90210", description: "I have home", petscription: "", status: "In Progress")
    @application1.pets << @pet
    @application1.petscription = "I have a nice home"
    @application1.status = "Pending"
    @application1.save
  end

  # User Story 10
  it 'displays all shelter names in reversed alphabetical order' do
    visit "/admin/shelters"
    # save_and_open_page
    expect(page).to have_http_status(:success)

    shelters = Shelter.order(name: :desc)
    displayed_shelter_names = page.all('h3').map(&:text)
    expect(displayed_shelter_names).to eq(shelters.map(&:name))
  end

  #User Story 11
  it "displays a section for 'Shelters with Pending Applications'" do
    visit "/admin/shelters"
    #save_and_open_page
    expect(page).to have_content("Shelters with Pending Applications:")
    expect(page).to have_content("Mystery Building")
    #expect(page).to have_button("Mystery Building Pending Application(s)")
    #On reading through the user story, no button is needed
    #Each section should just have a list of Pending Applications
    #This list should display every application associtated with that shelter.
  end
end