require 'rails_helper'

RSpec.feature "User can favorite gifs" do
  scenario "logged in user can favorite an existing gif" do
    user = User.create(username: "Jenny", password: "Password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    Gif.create(image_path: "http://giphy.com/embed/HIWuOLHmng95S")

    visit gifs_path

    click_button "Favorite"

    expect(current_path).to eq(users_favorite)
    expect(page).to have_content ("Added to favorites")
  end
end
