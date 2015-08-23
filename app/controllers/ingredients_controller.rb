class IngredientsController < ApplicationController
  before_action :require_user, except: [:show]

  def new
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 4)
  end

  def create
    @ingredient = Ingredient.new(ing_params)

    if @ingredient.save
      flash[:success] = "Ingredient successfully created!"
      redirect_to recipes_path
    else
      flash[:danger] = "Error creating ingredient"
      render :new
    end
  end

  private

  def ing_params
    params.require(:ingredient).permit(:name)
  end

end