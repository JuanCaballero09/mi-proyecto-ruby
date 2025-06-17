class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:formulario] 

  def index
    @seccion = params[:seccion] || "home"
    @grupos = Grupo.all
  end

  def home
    @seccion = "home"
    render :index
  end

  def productos
    @seccion = "productos"
    nombre_param = params[:nombre].tr("-", " ")
    @grupo = Grupo.find_by("LOWER(nombre) = ?", nombre_param.downcase)
    @productos = @grupo.products.where(disponible: true).order(id: :asc)
    render :index
  end

  def edit
    @seccion = "edit"
    @resource = current_user
    @resource_name = :user
    render :index
  end

  def menu
    @seccion = "menu"
    @grupos = Grupo.includes(:products)
    render :index
  end

  def carrito
    @seccion = "carrito"
    @carrito = session[:carrito] || []
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
  end

  def eliminar_del_carrito
    producto_id = params[:producto_id].to_i
    session[:carrito] ||= []
    session[:carrito].delete_if {|item| item["id"] == producto_id }
  end

  def formulario
    @seccion = "formulario"
    @producto = Product.find(params[:id])
    @usuario = current_user
    render :index
  end

  def create 
    producto = Product.find(params[:producto_id])
    pedido = Pedido.new(
      user: current_user,
      producto: producto,
      cantidad: params[:cantidad],
      total: producto.precio * params[:cantidad].to_i
    )
  end 

end
