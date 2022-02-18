class RestaurantsController < ApplicationController
  before_action :finder, only: %i[show edit update destroy]
  $category = %w[chinese italian japanese french belgian]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created'
    else
      render :new
    end
  end

  def show
    @reviews = @restaurant.reviews
  end

  def edit
    @category = %w[chinese italian japanese french belgian]
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path, notice: 'Restaurant was successfully'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurant_path, notice: 'Restaurant was successfully destroyed'
  end

  private

  def finder
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
