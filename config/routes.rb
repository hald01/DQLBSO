Rails.application.routes.draw do
  get 'signup' => 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/error', to: 'book_pages#error'
  root 'book_pages#home'

  resources :users
  resources :books

end
