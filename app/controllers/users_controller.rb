class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params_users
    if @user.save
      flash.now[:success] = "Account sign up successful"
      redirect_to @user     
    else
      render "new"    
    end
  end

  private
  def params_users
    params.require(:user).permit :username, :email, :password, 
                                  :password_confirmation
  end
end
