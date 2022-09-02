class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @food = Food.all

    @recipe_food = Food.joins(:recipe_foods).includes(:recipe_foods)
      .select('foods.name, foods.measurement_unit, foods.price,recipe_foods.quantity, recipe_foods.id')
      .where(recipe_foods: { recipe_id: params[:id] })

    if params[:public] && params[:check]
      @recipe = Recipe.find(params[:id])
      redirect_to recipe_path(params[:id]) if @recipe.update(public: params[:public])
    elsif params[:check] && !params[:public]
      @recipe = Recipe.find(params[:id])
      redirect_to recipe_path(params[:id]) if @recipe.update(public: params[:public])
    end
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

  def update
    @recipe = Recipe.find(params[:id])
    redirect_to recipe_path(params[:id]) if @recipe.update(public: params[:public])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to '/recipes'
  end
end
