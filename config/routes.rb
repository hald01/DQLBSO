Rails.application.routes.draw do
  get 'signup' => 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/set_cookies', to: 'book_pages#set_cookies'
  get '/show_cookies', to: 'book_pages#show_cookies'
  get '/error', to: 'book_pages#error'
  root 'book_pages#home'

  resources :users
  resources :books

end
