require 'rails_helper'

feature "Creating a new organization" do
  before do
    sign_in create(:user)
    @organization = create(:organization)
    visit "/organizations/#{ @organization.id }/edit"
  end

   scenario "User inputs all required fields" do
    fill_in "Name", with: "Good Times for Turtles"

    click_button "Update Organization"

    expect(page).to have_content("Organization was successfully updated.")
  end

  scenario "User omits a required field" do
    fill_in "Name", with: ""
    
  	click_button "Update Organization"
  	
  	expect(page).to have_content("There was a problem updating this organization.")
    expect(page).to have_content("name can't be blank")
  end
end
