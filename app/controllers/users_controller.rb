class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:show, :edit, :update, :index, :destroy]
  before_action :correct_user,    only: [:show, :edit, :update, ]
  before_action :admin_user,      only: [:index, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :address, :phone)
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = "Please log in."
    redirect_to signin_url
  end

  def correct_user
    @user = User.find(params[:id])
    begin
    redirect_to(root_url)
    flash[:success] = "you can't see another user info" 
    end unless current_user?(@user)
  end

  def admin_user
    begin
    redirect_to(root_url)
    flash[:success] = "only admin can see user list"
    end unless current_user.admin?
  end
  
end
