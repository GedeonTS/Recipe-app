class RecipeController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = recipe.find(params[:id])
  end
end
