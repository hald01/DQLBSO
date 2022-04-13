module BooksHelper
  def set_coo
    book = Book.find_by(id: params[:id])
    if book.present?
      @book = book
    else 
      @book = "abc"
    end
    cookies[:book_name] = @book
    cookies[:book_number] = @book
    flash[:success] = "Add to cart"
    redirect_to books_path
  end
end
