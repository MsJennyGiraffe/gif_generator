class Admin::GifsController < Admin::BaseController

  def new
    @categories = Category.all
    @gif = Gif.new
  end

  def create
    @gif = Gif.new
    @gif.get_giffy(params[:category])
    @gif.save
    flash[:success] = "Gif Successfully Generated!"
    redirect_to gifs_path
  end
end
