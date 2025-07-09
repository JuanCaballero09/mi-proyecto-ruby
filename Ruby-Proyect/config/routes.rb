Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }


  root to: "grupos#dashboard"
  resources :grupos do
    resources :products, module: :grupos
  end

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
  end
end
