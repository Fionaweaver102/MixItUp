module ApplicationHelper
  def current_user 
    User.find_by(id: session[:user_id]) 
   end 
 
   def logged_in? 
     !!current_user
   end 

   def find_cocktail 
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.user != current_user 
      redirect_to user_path(current_user)
    end 
  end 

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end 

  def find_user 
    @user = User.find(params[:id])
      if @user != current_user
        redirect_to user_path(current_user)
      end 
  end 
end
