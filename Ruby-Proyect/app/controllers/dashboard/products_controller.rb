class Dashboard::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to dashboard_products_path, 
      notice: "El producto fue creado exitosamente."
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:nombre, :descripcion, :precio, :grupo_id)
  end

  def check_admin
    unless current_user.admin? # Verifica si el usuario tiene rol de admin
      redirect_to root_path, alert: "No tienes acceso a esta página."
    end
  end
end
