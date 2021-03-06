Rails.application.routes.draw do

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'application#hello'
  # root 'users#index'
  root 'static_pages#home'

end
