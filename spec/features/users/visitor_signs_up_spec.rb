require 'spec_helper'

feature "Visitor signs up" do

  scenario 'with valid details' do
    sign_up_as FactoryBot.build(:user)
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_as FactoryBot.build(:user, email: 'wrong')
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_as FactoryBot.build(:user, password: '', password_confirmation: '')
    expect(page).to have_content('Sign in')
  end

end
