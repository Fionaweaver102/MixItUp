class CocktailsController < ApplicationController
  before_action :require_login, :find_cocktail, only: [:show, :edit, :update, :destroy]
  # helper_method :params 

  def index
    @user = current_user
    @ingredients = Ingredient.all

    if !params[:ingredient].blank?
      ingredient = Ingredient.where(id: params[:ingredient]).first
      @cocktails = ingredient.cocktails
    else 
      @cocktails = Cocktail.all.by_title
    end 
 
  end

  def show
    @user = current_user
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = current_user.cocktails.build
    10.times do 
      @cocktail.cocktail_ingredients.build 
    end 
  end

  def create
    @cocktail = current_user.cocktails.build(cocktail_params)
    if @cocktail.save
       redirect_to cocktail_path(@cocktail)
    else 
      @error = @cocktail.errors.full_messages 
      render :new
    end 
  end

  def edit
  end

  def update
      if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
      else 
        @error = @cocktail.errors.full_messages 
        render :edit 
      end 
  end 

  def destroy
    @cocktail.delete
    redirect_to cocktails_path(current_user)
  end 
 
  private 

  def cocktail_params
    params.require(:cocktail).permit(:title, :date_created, :image, ingredient_ids: [], ingredient_attributes: [:name], cocktail_ingredient_ids: [], cocktail_ingredients_attributes: [:amount, :ingredient_id])
  end 
end
