class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @lessons = Lesson.filter_lesson(@user.id).paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash.now[:success] = t :alert_signup_success
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
