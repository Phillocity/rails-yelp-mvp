class ReviewsController < ApplicationController
  before_action :finder, only: %i[edit update show destroy]

  def index
    @review = Review.all
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Your review has been added!'
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def show
    @reviews = Restaurant.find(params[:id]).reviews
  end

  private

  def finder
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
