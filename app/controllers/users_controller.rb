class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Sign Up Complete!'
    else
      render action: :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  
end
