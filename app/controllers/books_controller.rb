class BooksController < ApplicationController

  def index
    api_call = Book.new
    @response = api_call.API_call()
    @books = Book.all
    @available = Book.where(available: true)
    @unavailable = Book.where(available: false)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.available = true
    @book.save
    respond_to do |format|
      format.html { redirect_to books_path }
      format.js
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
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
