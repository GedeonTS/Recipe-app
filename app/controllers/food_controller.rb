# frozen_string_literal: true

class FoodController < ApplicationController
  def index
    @food = Food.all
  end

  def show
    @food = food.find(params[:id])
  end
end
