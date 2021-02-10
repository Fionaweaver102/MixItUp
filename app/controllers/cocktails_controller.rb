class CocktailsController < ApplicationController
  before_action :require_login, :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @cocktails = Cocktail.all
  end

  def show
    @user = current_user
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = current_user.cocktails.build
  end

  def create
    @cocktail = current_user.cocktails.build(cocktail_params)
      if @cocktail.save
       redirect_to cocktail_path(@cocktail)
    else 
      render :new
    end 
  end

  def edit
  end

  def update
      if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
      else 
        render :edit 
      end 
  end

  def destroy
    @cocktail.delete
    redirect_to cocktails_path(current_user)
  end

  private 

  def cocktail_params
    params.require(:cocktail).permit(:title, :date_created, :image, ingredient_ids: [], ingredient_attributes: [:name])
  end 
end
