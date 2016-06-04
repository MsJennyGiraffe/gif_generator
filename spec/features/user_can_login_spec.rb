require 'rails_helper'

RSpec.feature "an existing user can login" do
  scenario "an existing user can login" do
    user = User.create(username: "jenny", password: "password")

    visit root_path
    click_link "Sign In"

    fill_in "Username", with: "jenny"
    fill_in "Password", with: "password"
    click_button "Sign In"

    expect(page).to have_content("Welcome, jenny.")
  end
end
