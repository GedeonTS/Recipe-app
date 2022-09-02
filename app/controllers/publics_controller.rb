class PublicsController < ApplicationController
  def index
    @recipe = User.joins(:recipes).includes(:recipes)
      .select('users.name, recipes.name as recipe_name, recipes.description,recipes.id')
      .where(recipes: { public: 'yes' })

    @recipe_food = Food.joins(:recipe_foods).includes(:recipe_foods)
      .select('foods.name, foods.measurement_unit, foods.price,recipe_foods.quantity, recipe_foods.id')

    @all_public = []
    @recipe.each do |recipe|
      @all_public << { recipe:, recipe_food: @recipe_food.where(recipe_foods: { recipe_id: recipe.id }) }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @food = Food.all

    @recipe_food = Food.joins(:recipe_foods).includes(:recipe_foods)
      .select('foods.name, foods.measurement_unit, foods.price,recipe_foods.quantity, recipe_foods.id')
      .where(recipe_foods: { recipe_id: params[:id] })
  end
end
