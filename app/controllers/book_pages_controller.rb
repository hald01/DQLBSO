class BookPagesController < ApplicationController
include BooksHelper
  def home
    cookies.delete :book_name
    cookies.delete :book_number
  end

  def error
  end

  def set_cookies
    set_coo
  end
  
  def show_cookies
    @book_name = cookies[:book_name]
    @book_number = cookies[:book_number]
  end
end
