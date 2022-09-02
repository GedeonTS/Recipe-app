class RecipeFoodsController < ApplicationController
  def index
    @recipe_food = RecipeFood.all
  end

  def show
    @recipe_food = RecipeFood.where(recipe_id: params[:id])
  end

  def new
    @recipe_food = RecipeFood.new
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(params[:recipe_food].permit(:food_id, :quantity))
    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
  end
end
