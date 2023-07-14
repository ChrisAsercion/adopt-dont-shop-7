require "rails_helper"

RSpec.describe "Application show" do
  before :each do
    @shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @pet = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @application_1 = Application.create!(name: "Topher C.", address: "123 sesame st. New York, NY 10001", description: "I want dog", status: "Accepted")
    #@application_1.pets << @pet

  end

  it 'page has application data' do
    visit "/applications/#{@application_1.id}"
    # save_and_open_page
    expect(page).to have_content("Name: Topher C.")
    expect(page).to have_content("Address: 123 sesame st. New York, NY 10001")
    expect(page).to have_content("Description: I want dog")
    expect(page).to have_content("Status: Accepted")
    expect(page).to have_link("Scooby")
  end
  # User Story 4
  it 'page has pets search form' do
    visit "/applications/#{@application_1.id}"
    save_and_open_page
    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_field("Search")
  end
end