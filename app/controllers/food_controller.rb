class FoodController < ApplicationController
  def index
    @food = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end
end
