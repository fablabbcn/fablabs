require 'spec_helper'

feature "Starting a discussion" do

  given(:machine) { FactoryBot.create(:machine) }

  skip "as a user" do
    sign_in
    visit machine_path(machine)
    click_link "Start a new Discussion"
    fill_in "Title", with: "Should I get this?"
    fill_in "Body", with: "I dunno?"
    click_button "Create Discussion"
    expect(page).to have_content("Discussion Created")
  end

end
