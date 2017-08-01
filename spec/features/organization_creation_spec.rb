require 'rails_helper'

feature "Creating a new organization" do
  before do
    sign_in create(:user)
    visit "/organization/new"
  end

   scenario "User inputs all required fields" do
    fill_in "Name", with: "Good Deeds for Doggies"

    click_button "Create Organization"

    expect(page).to have_content("Good Deeds for Doggies")
    expect(page).to have_content("Organization was successfully created.")
  end
end
