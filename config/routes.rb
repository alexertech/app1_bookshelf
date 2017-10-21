Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/books'     , to: 'books#index' , as: :books
  get '/books/new' , to: 'books#new'   , as: :books_new

end
