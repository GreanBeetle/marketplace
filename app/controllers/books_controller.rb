class BooksController < ApplicationController

  def index
    api_call = Book.new
    @response = api_call.API_call()
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.available = true
    @book.save
    if @book.save
      flash[:notice] = "#{@book.title} was added"
    end
    respond_to do |format|
      format.html { redirect_to books_path }
      format.js
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :available)
    end

end
