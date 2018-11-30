require 'spec_helper'

describe "Visitor homepage" do

  it "has homepage" do
    lab = FactoryBot.create(:lab, name: 'verified', country_code: 'gb', workflow_state: 'approved')
    visit root_path
    expect(page).to have_content "Register your lab"
  end

  skip "shows around the world button if country has no labs" do
    current_country = 'fr'
    visit root_path
    expect(page).to have_link("Around the World")
  end

  skip "does not show unverified labs" do
    FactoryBot.create(:lab, name: 'unverified')
    visit root_path
    expect(page).to_not have_link('unverified')
  end

  skip "shows verified labs" do
    lab = FactoryBot.create(:lab, name: 'verified', workflow_state: 'approved')
    visit root_path
    expect(page).to have_link('verified')
  end

  skip "doesn't show verified labs from other country" do
    lab = FactoryBot.create(:lab, name: 'verified', country_code: 'za', workflow_state: 'approved')
    visit root_path
    expect(page).to_not have_link('verified')
  end

end
