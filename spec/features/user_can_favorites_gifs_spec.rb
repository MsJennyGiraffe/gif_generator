require 'rails_helper'

RSpec.feature "User can favorite gifs" do
  scenario "logged in user can favorite an existing gif" do
    user = User.create(username: "Jenny", password: "Password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    category = Category.create(name: "kitten")
    Gif.create(category: category)

    visit gifs_path

    click_link "Favorite"

    expect(current_path).to eq(users_favorite_path(user))
    # save_and_open_page

    expect(page).to have_content ("Added to Favorites")
  end
end
