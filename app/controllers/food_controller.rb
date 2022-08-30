class FoodController < ApplicationController
    def index
      @food = food.all
    end
  
    def show
      @food = food.find(params[:id])
    end
  end
  