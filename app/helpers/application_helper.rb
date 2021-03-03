module ApplicationHelper
  def current_user 
    User.find_by(id: session[:user_id]) 
   end 
 
   def logged_in? 
     session[:user_id] != nil 
   end 

   def require_login
    render 'errors', :static => "home" if session[:user_id].nil? 
   end

   def authenticate(user)
    user && user.authenticate(params[:password])
  end

   def find_cocktail 
    @cocktail = Cocktail.find(params[:id])
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
