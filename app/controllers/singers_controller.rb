class SingersController < ApplicationController
  def index
    @singers = Singer.all
  end

  def create
    @singer = Singer.new(singer_params)
  end

  def show
    @singer = Singer.find(params[:id])
    @rating = Rating.new
    @ratings = @singer.rating_ids
    @ratingsArray = []
    @ratings.each do |rating|
      @ratingsArray << Rating.find_by(id: rating)
    end
    return @ratingsArray
  end

  def new
    @singer = Singer.new
  end

  def edit
    singer = Singer.find(params[:id])
    if singer.destroy
      redirect_back(fallback_location: root_path)
    else
      error = { detail: "Artist with id #{params[:id]} cannot be deleted" }
    end
  end

  private

  def singer_params
    params.require(:singer).permit(:name, :image_url, :photo)
  end
end
