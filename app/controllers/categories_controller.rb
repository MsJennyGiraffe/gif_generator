class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @gifs = @category.gifs
  end

  def index
    @categories = Category.all
  end
end
