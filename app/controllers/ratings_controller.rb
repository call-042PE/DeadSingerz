class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def create
    @rating = Rating.new(rating_params)
    @singer = Singer.find(params[:singer_id])
    @rating.singer = @singer
    @rating.save
    redirect_to singer_path(@singer)
  end

  def new
    @singer = Singer.find(params[:singer_id])
    @rating = Rating.new
  end


  private

  def rating_params
    params.require(:rating).permit(:rating, :review)
  end
end
