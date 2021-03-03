class IngredientsController < ApplicationController

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    find_ingredient
    @cocktail.ingredients.delete(@cocktail)
    redirect_to user_cocktail_path(current_user)
  end 
      
  private 

  def cocktail_ingredient_params
    params.require(:cocktail_ingredient).permit(:cocktail_id, :ingredient_id)
  end 

end
