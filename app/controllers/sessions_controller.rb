class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :google, :facebook]

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
  redirect_to root_path
end 


def google
  @user = User.find_or_create_by(username: auth['info']['name']) do |u|
    u.email = auth['info']['email']
    u.password = SecureRandom.hex(8)
  end 

  if @user && @user.id 
    session[:user_id] = @user.id 
    redirect_to cocktails_path
  else 
    redirect_to root_path
  end 
end

def facebook
  # @user = User.find_or_create_by(username: auth['info']['username']) do |u|
  #   u.first_name = auth['info']['name']
  #   u.email = auth['info']['email']
   
  #   u.password = SecureRandom.hex(10)
  #   # u.image = auth['info']['image']
  # end
  # if @user && @user.id 
  #   session[:user_id] = @user.id
  #   redirect_to cocktails_path
  # else 
  #   redirect_to root_path
  # end 
end


private 

def auth
  request.env['omniauth.auth']
end 

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
end 

end

