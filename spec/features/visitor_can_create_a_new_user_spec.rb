require 'rails_helper'

RSpec.feature "visitor can create a new user" do
  scenario "a new user can be created" do
    visit root_path
    click_link "Create Account"

    fill_in "Username", with: "jenny"
    fill_in "Password", with: "password"
    click_button "Create Account"

    within(".navbar") do
      expect(page).to have_content("Welcome, Jenny.")
    end
  end
end
