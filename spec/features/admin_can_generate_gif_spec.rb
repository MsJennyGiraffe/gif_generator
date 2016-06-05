require 'rails_helper'

RSpec.feature "admin can generate gif" do
  scenario "admin can generate a gif" do
    admin = User.create(username: "admin", password: "password", role: 1)
    Category.create(name: "Puppies")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_gif_path

    choose "category_Puppies"
    click_button "Generate Gif"

    expect(current_path).to eq(gifs_path)
    save_and_open_page
    expect(page).to have_content("Gif Successfully Generated!")
    expect(page).to have_content("Puppies")
  end
end
