class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = "Recipe Created!"
      redirect_to recipes_path
    else
      flash[:danger] = "Error creating recipe"
      redirect_to new_recipe_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description)
  end
end