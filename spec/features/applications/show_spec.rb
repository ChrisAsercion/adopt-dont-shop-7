require "rails_helper"

RSpec.describe "Application show" do
  before :each do
    @shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @pet = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @pet2 = Pet.create!(name: "Scrappy", age: 1, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @pet3 = Pet.create!(name: "Scoobydoo", age: 3, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @pet4 = Pet.create!(name: "Mr. Scooby", age: 4, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
    @application_1 = Application.create!(name: "Topher C.", address: "123 sesame st. New York, NY 10001", status: "In Progress")
  end

  # User Story 1
  it 'page has application data' do
    @application_1.pets << @pet
    visit "/applications/#{@application_1.id}"
    # save_and_open_page
    expect(page).to have_content("Name: Topher C.")
    expect(page).to have_content("Address: 123 sesame st. New York, NY 10001")
    expect(page).to have_content("Status: In Progress")
    expect(page).to have_link("Scooby")
  end

  # User Story 4 & 5 & 7
  it 'page has pets search form' do
    visit "/applications/#{@application_1.id}"
    # save_and_open_page
    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_field("Search")
    expect(page).to_not have_button("Submit this Application")
    fill_in("Search", with: "Scooby")
    click_button("Search")
    # save_and_open_page
    expect(page).to have_content("Scooby")
    expect(current_path).to eq("/applications/#{@application_1.id}")
    within("#search-results") do
      click_button("Adopt Scooby")
    end
    # save_and_open_page
    expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(page).to have_link("Scooby")
  end

  # User Story 6
  it 'page has submit button' do
    @application_1.pets << @pet
    visit "/applications/#{@application_1.id}"
    save_and_open_page
    fill_in("Descriptio", with: "Im a good boy")
    click_on "Submit"
    expect(page).to have_button("Submit this Application")
    click_on "Submit this Application"
    # save_and_open_page
    expect(page).to have_content("Status: Pending")
    expect(page).to have_link("Scooby")
    expect(page).to_not have_content("Add a Pet to this Application")
    expect(page).to_not have_field("Search")
  end

  # User Story 8
  it 'page pet search finds partial matches' do
    visit "/applications/#{@application_1.id}"
    fill_in("Search", with: "Scoob")
    click_on "Search"
    # save_and_open_page
    expect(page).to have_button("Adopt Scooby")
    expect(page).to have_button("Adopt Scoobydoo")
    expect(page).to have_button("Adopt Mr. Scooby")
    expect(page).to_not have_button("Adopt Scrappy")
  end
  
  # User Story 9
  it 'page pet search is case insensitive' do
    visit "/applications/#{@application_1.id}"
    fill_in("Search", with: "OOb")
    click_on "Search"
    # save_and_open_page
    expect(page).to have_button("Adopt Scooby")
    expect(page).to have_button("Adopt Scoobydoo")
    expect(page).to have_button("Adopt Mr. Scooby")
    expect(page).to_not have_button("Adopt Scrappy")
  end
end