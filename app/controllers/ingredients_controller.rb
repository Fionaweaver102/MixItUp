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
  end 
      
  private 

  def cocktail_ingredient_params
    params.require(:cocktail_ingredient).permit(:cocktail_id, :ingredient_id)
  end 

end
