class AddUserIdToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :user, index: true, foreign_key: true
    add_reference :favorites, :gif, index: true, foreign_key: true

  end
end
