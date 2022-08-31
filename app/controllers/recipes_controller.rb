class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @current = current_user
  end

  def create
    new_recipe = current_user.recipes.new(params[:recipe].permit(:name, :description, :cooking_time, :preparation_time))
    respond_to do |format|
      format.html do
        if new_recipe.save
          redirect_to '/recipes'
        else
          render new, alert: 'Recipe not created'
        end
      end
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to '/recipes'
  end
end
