class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :google]

 def new #login
 end

def create
  @user = User.find_by(username: params[:username])
  if @user.nil?
    @error = "Username is invalid."
    render :new
  else 
    if authenticate(@user)
      session[:user_id] = @user.id
      redirect_to cocktails_path  
    else 
      @error = "Invalid password" 
      render :new
    end 
  end
end

def logout 
  session.clear
  redirect_to login_path
end 


def google
end

def facebook
end


private 

def auth
end 

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
end 

end

