require 'rails_helper'

RSpec.feature "Admin can delete a category" do
  scenario "Admin can delete an existing category" do
    category = Category.create(name: "puppies")
    Gif.create(category: category)
    Category.create(name: "kittens")

    visit categories_path

    expect(page).to have_content("puppies")
    expect(page).to have_content("kittens")

    click_link "puppies"

    click_link "Delete"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("kittens")
    expect(page).to_not have_content("puppies")

  end
end
