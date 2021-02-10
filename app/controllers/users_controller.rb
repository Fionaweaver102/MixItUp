class UsersController < ApplicationController
before_action :find_user, only: [:edit, :update, :destroy]

def new #signup
  @user = User.new 
end

def create
  @user = User.new(user_params)
  if @user.save 
    session[:user_id] = @user.id
    redirect_to cocktails_path(@user)
  else 
    render :new 
  end 
end

def show 
end 

def edit
end 

def update 
  @user.update(user_params)
  redirect_to profile_path(@user)
end 

def destroy  
  @user.destroy 
  session.clear 
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
