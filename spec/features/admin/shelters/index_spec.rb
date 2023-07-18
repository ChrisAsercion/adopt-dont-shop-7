require 'rails_helper'

RSpec.describe 'Admin Shelter Show Page' do
  before :each do
    @shelter1 = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @shelter2 = Shelter.create!(name: "Pets Galore", city: "Sacramento CA", foster_program: false, rank: 10)
    @shelter3 = Shelter.create!(name: "Dog Pound", city: "San Francisco CA", foster_program: false, rank: 11)
    @shelter4 = Shelter.create!(name: "Cat Pound", city: "Culver CA", foster_program: false, rank: 12)
    @application_1 = Application.create!(name: "Topher C.", street_address: "103 W. East St.", city: "Los Angeles", state: "CA", zip: "90210", description: "I have home", petscription: "", status: "In Progress")
    
  end
#When I visit the admin shelter index

  # User Story 10
  it 'displays all shelter names in reversed alphabetical order' do
    visit "/admin/shelters"
    # save_and_open_page
    expect(page).to have_http_status(:success)

    shelters = Shelter.order(name: :desc)
    shelters.each_with_index do |shelter, index|
      expect(page.body).to include(shelter.name)
      expect(page.body.index(shelter.name)).to be < page.body.index(shelters[index + 1].name) unless index == shelters.size - 1
    end
  end

  #User Story 11
  it "displays a section for 'Shelters with Pending Applications'" do
    visit "/admin/shelters"
    @application_1.status = "Pending"
    require 'pry'; binding.pry
    shelters = Shelter.select(status: "Pending")
    expect(page).to have_content("Shelters with Pending Applications")
    
  end
end