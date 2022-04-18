Rails.application.routes.draw do
  get 'signup' => 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/error', to: 'book_pages#error'
  root 'book_pages#home'

  resources :users do 
    member do
      get 'cart', to: 'carts#show'
      patch 'add-book-to-cart', to: 'carts#add_to_cart' 
    end
  end
  resources :books

end
