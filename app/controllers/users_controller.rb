class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

def new #signup
  @user = User.new 
end

def create
  @user = User.create!(user_params)
  if @user.valid? 
    @user.save 
    session[:user_id] = @user.id
    redirect_to cocktails_path 
  else 
    @error = @user.errors.full_messages 
    render :new 
  end 
end

def show 
  @user = current_user
end 

def edit
  @user = current_user
end 

def update 
  @user = current_user
 if @user.update(user_params)
  redirect_to user_profile_path(@user)
 else 
  render :edit
 end 
end 

def destroy  
  current_user.destroy 
  session[:user_id] = nil  
  redirect_to root_path
end 

def profile
  @user = current_user
end 


private 

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
end 
end
