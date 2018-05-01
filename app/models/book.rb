class Book < ApplicationRecord

  def API_call
    response = RestClient::Request.execute(method: :get, url: 'https://api.nytimes.com/svc/books/v3/lists/combined-print-and-e-book-fiction.json', headers: {api_key: ENV['NYT_API_KEY']})
    JSON.parse(response)
  end

end
