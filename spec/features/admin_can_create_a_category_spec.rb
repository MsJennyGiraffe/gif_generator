require 'rails_helper'

RSpec.feature "Admin can create a category" do
  scenario "Admin can create a category" do
    admin = User.create(username: "Admin", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_category_path

    expect(page).to have_content("Create a Category")

    fill_in "Name", with: "Puppies"
    click_button "Create Category"

    expect(current_path).to eq(category_path(Category.last))

    expect(page).to have_content("Category Successfully Created!")
    expect(page).to have_content("Puppies")
  end

  scenario "default user cannot create a category" do
    user = User.create(username: "default", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_admin_category_path

    expect(page).to have_content("404 Page Not Found")
    expect(page).to_not have_content("Create a Category")
  end
end
