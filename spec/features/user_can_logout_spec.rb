RSpec.feature "user can logout" do
  scenario "A logged in user can logout" do
    user = User.create(username: "jenny", password: "password")

    visit root_path
    click_link "Sign In"

    fill_in "Username", with: "jenny"
    fill_in "Password", with: "password"
    click_button "Sign In"

    expect(page).to have_content("Welcome, Jenny.")

    click_link "Logout"

    expect(page).to_not have_content("Welcome, Jenny.")
  end
end
