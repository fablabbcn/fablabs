require 'spec_helper'

feature "Viewing a machine" do

  given(:machine) { FactoryGirl.create(:machine) }

  scenario "as a visitor" do
    visit machine_path(machine)
    expect(page).to have_css('h1', text: machine.name)
  end

  scenario "as a user" do
    sign_in
    visit machine_path(machine)
    expect(page).to have_title(machine)
  end

  scenario "as an admin" do
    sign_in_superadmin
    visit machine_path(machine)
    expect(page).to have_title(machine.name)
    expect(page).to have_css('h1', text: machine.name)
  end

end
