class BooksController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :load_book, except: [:new, :create, :index]
  before_action :admin_user, only: [:new, :create, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Create new book!"
      redirect_to @book
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @books = Book.paginate(page: params[:page])
  end

  def edit; end

  def show; end

  def update
    if @book.update(book_params)
      flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @book&.destroy
      flash[:success] = "success"
      redirect_to books_path      
    else
      flash[:danger] = "failed"
      redirect_to error_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :price, :number)
  end
end
