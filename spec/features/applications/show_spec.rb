require "rails_helper"

RSpec.describe "Application show" do
  it 'page has application data' do
    application_1 = Application.create!(name: "Example app", address: "123 sesame st. New York, NY 10001", description: "I want dog", status: "Accepted")
    visit "/application/#{application_1.id}"
    expect(page).to have_content("Name: Example app")
  end
end