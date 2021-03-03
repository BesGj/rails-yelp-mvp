class RestaurantsController < ApplicationController
 before_action :set_rest, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def edit; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(rest_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

  end


 private

  def rest_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number, :rating)
  end

  def set_rest
    @restaurant = Restaurant.find(params[:id])
  end


end
