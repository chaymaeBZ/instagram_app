Rails.application.routes.draw do
  
  root 'static_pages#index'
  get 'create', to: 'static_pages#create'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/users/auth/:provider/callback', to: 'static_pages#index'
end
