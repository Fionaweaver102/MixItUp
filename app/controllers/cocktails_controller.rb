class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :edit, :update, :destroy]

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
    @user = current_user
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
      @cocktail.update(cocktail_params)
      redirect_to user_cocktail_path(current_user, @cocktail)
  end

  def destroy
    @cocktail.delete
    redirect_to user_cocktails_path(current_user)
  end

  private 

  def cocktail_params
    params.require(:cocktail).permit(:user_id, :title, :date_created, :image, ingredient_ids: [], ingredient_attributes: [:name])
  end 
end
