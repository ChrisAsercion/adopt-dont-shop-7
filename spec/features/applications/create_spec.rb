require "rails_helper"

RSpec.describe "Application new page" do
  let!(:shelter) {create(:shelter) }
  let!(:pet) {create(:pet)}
  

  it 'links from pet index page' do
    visit "/pets"
    expect(page).to have_link("Start an Application")
    click_link("Start an Application")
    # save_and_open_page
    expect(current_path).to eq("/applications/new")
  end
  # User Story 2
  it 'can create a new applications' do
    visit "/applications/new"
    fill_in "Name", with: "Topher C."
    fill_in "street_address", with: "123 sesame st."
    fill_in "City", with: "New York"
    fill_in "State", with: "NY"
    fill_in "Zip", with: "10001"
    fill_in "Description", with: "I love dog"
    click_button("Submit")
    # save_and_open_page
    expect(current_path).to eq("/applications/#{Application.last.id}")
    expect(page).to have_content("Topher C.")
    expect(page).to have_content("123 sesame st.")
    expect(page).to have_content("New York")
    expect(page).to have_content("NY")
    expect(page).to have_content("10001")
    expect(page).to have_content("I love dog")
    expect(page).to have_content("In Progress")
  end
  # User Story 3
  it 'returns to itself if not all fields are filled in' do
    visit "/applications/new"
    click_button("Submit")
    # save_and_open_page
    expect(current_path).to eq("/applications/new")
    expect(page).to have_content("Error: Name can't be blank, Street address can't be blank, City can't be blank, State can't be blank, Zip can't be blank, Description can't be blank")
  end
end