class CartsController < ApplicationController
  before_action :logged_in_user
  before_action :load_user
  before_action :correct_user

  def show
    @user = User.find(params[:id])
    @cart = @user.cart
    render 'cart/show'
  end

  def add_to_cart
    book = [params[:book_id].to_s, params[:book_name], params[:book_price].to_s]
    current_user.cart.books << book
    if current_user.cart.save 
      @user = current_user
      @cart = current_user.cart
      flash[:success] = "Success to add a book to the cart"
      render 'cart/show', status: :unprocessable_entity
    else
      flash[:danger] = "Something wrong, You can try again!"
      redirect_to root_path
    end
  end
end
