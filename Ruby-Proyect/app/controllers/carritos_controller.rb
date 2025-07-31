class CarritosController < ApplicationController
  def show
    @carrito = Carrito.find_by(id: session[:carrito_id])
    @items = @carrito&.carrito_items || []
  end
end
