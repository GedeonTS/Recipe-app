class ShoppingsController < ApplicationController
  def index
    @foods = Food.all
    @recipe_food = Food.joins(:recipe_foods).includes(:recipe_foods)
    @shopping_list = []
    @price = 0

    @foods.each do |food|
      @shopping_list << food unless @recipe_food.include?(food)
    end
    @shopping_list.each do |food|
      @price += food.price
    end
  end
end
