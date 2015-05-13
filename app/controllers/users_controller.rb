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

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes user_params
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, 
                                 :password_confirmation
  end
end
