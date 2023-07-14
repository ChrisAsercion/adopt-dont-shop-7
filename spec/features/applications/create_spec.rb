require "rails_helper"

RSpec.describe "Application new page" do
  before :each do
    @shelter = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    @pet = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter.id)
  end

  it 'links from pet index page' do
    visit "/pets"
    expect(page).to have_link("Start an Application")
    click_link("Start an Application")
    save_and_open_page
    expect(current_path).to eq("/applications/new")
  end

  it 'can create a new applications' do
    visit "/applications/new"
    fill_in "Name", with: "Topher C."
    fill_in "Address", with: "123 sesame st. New York, NY 10001"
    fill_in "Description", with: "I want dog"
    click_button("Submit Application")
    # save_and_open_page
    expect(current_path).to eq("/applications/#{Application.last.id}")
    expect(page).to have_content("Topher C.")
    expect(page).to have_content("123 sesame st. New York, NY 10001")
    expect(page).to have_content("I want dog")
    expect(page).to have_content("In Progress")
  end
end