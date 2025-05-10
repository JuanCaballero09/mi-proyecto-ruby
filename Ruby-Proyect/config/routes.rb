Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  get "index", to: "pages#index"
  get 'carrito', to: 'pages#carrito', as: 'carrito' 
  get 'menu', to: 'pages#menu', as: 'menu'


  namespace :dashboard do
    root to: "dashboard#index"
    resources :grupos, path: "grupos"
    resources :products, path: "productos"
  end



end
