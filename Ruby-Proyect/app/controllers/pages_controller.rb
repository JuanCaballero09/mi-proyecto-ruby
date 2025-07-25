class PagesController < ApplicationController
  def carrito
    @seccion = "carrito"
    @carrito = session[:carrito] || []
    producto_ids = @carrito.map { |item| item["id"] }
      @productos_hash = Product.where(id: producto_ids).index_by(&:id)
    @total = @carrito.sum { |p| p["precio"].to_f * p["cantidad"] }
    render :index
  end

  def agregar_al_carrito
    session[:carrito] ||= []
    producto_id = params[:producto_id].to_i
    producto = Product.find(producto_id)


    item = session[:carrito].find { |i| i["id"] == producto_id }
    if item
      item["cantidad"] = (item["cantidad"] || 0) + 1
    else
      session[:carrito] << {
        "id" => producto.id,
        "nombre" => producto.nombre,
        "precio" => producto.precio,
        "cantidad" => 1
      }
    end
    total = session[:carrito].sum { |i| i["cantidad"] } # Encargado del contador de los productos que hay en el carrito.

    render json: { status: "ok", total_productos: total } # Respuesta de cuando un producto es mandado al carrito.
  end

  def eliminar_del_carrito
    producto_id = params[:producto_id].to_i
    session[:carrito] ||= []
    session[:carrito].delete_if { |item| item["id"] == producto_id }
  end

  def create
    producto = Product.find(params[:producto_id])
    Pedido.new(
      user: current_user,
      producto: producto,
      cantidad: params[:cantidad],
      total: producto.precio * params[:cantidad].to_i
    )
  end
end
