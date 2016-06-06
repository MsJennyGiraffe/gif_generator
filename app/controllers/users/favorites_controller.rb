class Users::FavoritesController < Users::BaseController
  def show
    flash[:success] = "Added to Favorites"
  end
end
