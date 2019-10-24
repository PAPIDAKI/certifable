Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home'=>'static_pages#home'
  get '/contact'=>'static_pages#contact'
  get '/help'=>'static_pages#help'
  get '/about' =>'static_pages#about'
  
  get '/signup' =>'users#new'
  get '/login' =>'sessions#new'
  post '/login' =>'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
end
