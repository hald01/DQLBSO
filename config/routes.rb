Rails.application.routes.draw do
  get 'signup' => 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/error', to: 'book_pages#error'
  get '/about', to: 'book_pages#about'
  root 'book_pages#home'

  resources :users
end
