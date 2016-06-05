class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    flash[:success] = "Category Successfully Created!"
    redirect_to category_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
