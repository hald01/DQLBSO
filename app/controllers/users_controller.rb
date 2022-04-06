class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:show, :edit, :update, :index]
  before_action :correct_user,    only: [:show, :edit, :update, ]
  before_action :admin_user,      only: :index

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
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :adress, :phone)
  end
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to signin_url
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
