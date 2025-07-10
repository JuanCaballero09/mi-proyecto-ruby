Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }


  root to: "grupos#dashboard"

  resources :grupos, path: "categoria", only: [ :index, :show ] do
    resources :products, path: "producto", only: [ :index, :show ], module: :grupos
    resources :banners, path: "banner", only: [:index, :create, :destroy]
  end
  
  resources :products, path: "productos", only: [:index] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets

  # resources :pedidos, only: [:create] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
  namespace :dashboard do
    root to: "dashboard#index"
    resources :grupos, path: "grupos"
    resources :ingredientes
    resources :products, path: "productos" do
      member do
        patch :toggle_disponibilidad
      end
    end
    resources :banners, only: [:index, :create, :destroy]
  end
end
