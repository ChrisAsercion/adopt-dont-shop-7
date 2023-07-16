require "rails_helper"

RSpec.describe "Application show" do
  before :each do
    @shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @pet = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @pet2 = Pet.create!(name: "Scrappy", age: 1, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @application_1 = Application.create!(name: "Topher C.", address: "123 sesame st. New York, NY 10001", description: "I want dog", status: "In Progress")
    
  end
  # User Story 1
  it 'page has application data' do
    @application_1.pets << @pet
    visit "/applications/#{@application_1.id}"
    # save_and_open_page
    expect(page).to have_content("Name: Topher C.")
    expect(page).to have_content("Address: 123 sesame st. New York, NY 10001")
    expect(page).to have_content("Description: I want dog")
    expect(page).to have_content("Status: In Progress")
    expect(page).to have_link("Scooby")
  end
  # User Story 4 & 5 & 7
  it 'page has pets search form' do
    visit "/applications/#{@application_1.id}"
    save_and_open_page
    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_field("Search")
    expect(page).to_not have_button("Submit this Application")
    fill_in("Search", with: "Scooby")
    click_button("Search")
    # save_and_open_page
    expect(page).to have_content("Scooby")
    expect(current_path).to eq("/applications/#{@application_1.id}")
    click_button("Adopt this Pet")
    # save_and_open_page
    expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(page).to have_link("Scooby")
  end

  #User Story 6
  it 'page has submit button' do
    @application_1.pets << @pet
    visit "/applications/#{@application_1.id}"
    expect(page).to have_button("Submit this Application")
    click_on "Submit this Application"
    # save_and_open_page
    expect(page).to have_content("Status: Pending")
    expect(page).to have_link("Scooby")
    expect(page).to_not have_content("Add a Pet to this Application")
    expect(page).to_not have_field("Search")

  end
end