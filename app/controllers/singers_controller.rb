class SingersController < ApplicationController
  #skip_before_action :authenticate_user!, only: :index
  before_action :set_singer, only: [:show, :edit, :destroy]
  def index
    @singers = Singer.all
    @bookings = Booking.all
  end

  def create
    @singer = Singer.new(singer_params)
    @user = current_user
    @singer.user = @user

    if @singer.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def show
    @singer = Singer.find(params[:id])
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

  def destroy
    @singer = Singer.find(params[:id])
    @singer.destroy
    redirect_to dashboard_path(@user)
  end

  private

  def singer_params
    params.require(:singer).permit(:name, :image_url, :photo, :price, :bio, :date, :death_year)
  end

  def set_singer
    @singer = Singer.find(params[:id])
  end
end
