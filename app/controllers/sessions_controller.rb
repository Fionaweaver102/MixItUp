class SessionsController < ApplicationController

def new #login
  @user = User.new
end

def create
  @user = User.find_by(username: params[:username])
  if !@user
    @error = "Username is invalid."
    render :new
  elsif !user.authenticate(params[:password])
    @error =  "Password is invalid"
    render :new  
  else 
    session[:user_id] = @user.id
    redirect_to cocktails_path 
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
