require 'rails_helper'

feature "Creating a new organization" do
  before do
    sign_in create(:user)
    visit "/organizations/new"
  end

   scenario "User inputs all required fields" do
    fill_in "Name", with: "Good Deeds for Doggies"

    click_button "Create Organization"

    expect(page).to have_content("Organization was successfully created.")
  end

  scenario "User omits a required field" do
  	click_button "Create Organization"
  	
  	expect(page).to have_content("There was a problem creating this organization.")
    expect(page).to have_content("name can't be blank")
  end
end
