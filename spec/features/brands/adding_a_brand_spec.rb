require 'spec_helper'

feature "Adding a brand" do

  scenario "as a visitor" do
    visit new_brand_path
    expect(page.title).to match('Sign in')
  end

  scenario "as a user" do
    sign_in
    visit new_brand_path
  end

  scenario "as an admin" do
    sign_in_superadmin
    visit new_brand_path
    fill_in "Name", with: "Roland"
    click_button "Create Brand"
    expect(page).to have_content("Brand Created")
  end

end
