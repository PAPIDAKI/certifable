Rails.application.routes.draw do
  get '/home'=>'static_pages#home'
  get '/contact'=>'static_pages#contact'
  get '/help'=>'static_pages#help'
  get '/about' =>'static_pages#about'
  root 'static_pages#home'
  
  get '/signup' =>'users#new'
end
