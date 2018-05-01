class BooksController < ApplicationController

  def index
    api_call = Book.new
    @response = api_call.API_call()
  end

end
