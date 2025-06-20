Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }


  root to: "pages#index"

  # Rotas del page
  get "carrito", to: "pages#carrito", as: "carrito"

  get "editar", to: "pages#edit", as: "edit"
  get "menu", to: "pages#menu", as: "menu"
  get "categoria/:nombre", to: "pages#grupo", as: "productos_por_grupo"
  get "producto/:id", to: "pages#productos", as: "producto"
  get "comprar/:id", to: "pages#formulario", as: "formulario"
  post "agregar_al_carrito", to: "pages#agregar_al_carrito", as: "agregar_al_carrito"
  post "carrito/eliminar", to: "pages#eliminar_del_carrito", as: "eliminar_del_carrito"

  resources :pedidos, only: [:create] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
  namespace :dashboard do
    root to: "dashboard#index"
    resources :grupos, path: "grupos"
    resources :products, path: "productos" do
      member do
        patch :toggle_disponibilidad
      end
    end
  end
end
