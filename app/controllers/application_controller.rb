class ApplicationController < ActionController::Base
  include SessionsHelper

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
    @user = User.find_by(id: params[:id])
    return if @user.present?
    flash[:danger] = "User not found"
    redirect_to error_path
  end

  def load_book    
    @book = Book.find_by(id: params[:id])
    return if @book.present?
    flash[:danger] = "Book not found"
    redirect_to error_path
  end
end
