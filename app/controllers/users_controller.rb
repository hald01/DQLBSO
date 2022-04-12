class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :load_user, only: [:edit, :show, :destroy, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Book Store!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy    
    if @user&.destroy
      flash[:success] = "success"
      redirect_to users_path      
    else
      flash[:danger] = "failed"
      redirect_to error_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :address, :phone)
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = "Please log in."
    redirect_to signin_path
  end

  def correct_user
    return if current_user?(@user)
    flash[:success] = "you can't see another user info"
    redirect_to error_path
  end

  def admin_user
    return if current_user.admin?
    flash[:success] = "only admin can see user list"
    redirect_to error_path
  end

  def load_user    
    user = User.find_by(id: params[:id])
    if user.present?
      @user = user
    else
      flash[:danger] = "User id does not exits"
      redirect_to error_path
    end
  end
end
