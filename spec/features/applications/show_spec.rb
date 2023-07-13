require "rails_helper"

RSpec.describe "Application show" do
  before :each do
    @application_1 = Application.create!(name: "Example app", address: "123 sesame st. New York, NY 10001", description: "I want dog", status: "Accepted")
  end

  it 'page has application data' do
    visit "/applications/#{@application_1.id}"
    save_and_open_page
    expect(page).to have_content("Name: Example app")
    expect(page).to have_content("Address: 123 sesame st. New York, NY 10001")
    expect(page).to have_content("Description: I want dog")
    expect(page).to have_content("Status: Accepted")
  end
end