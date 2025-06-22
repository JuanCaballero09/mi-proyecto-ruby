class Dashboard::ProductsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :check_admin

  def index
    @products = Product.order(:id)
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to dashboard_products_path, notice: "Producto eliminado exitosamente."
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

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to dashboard_products_path, notice: "Producto actualizado"
    else
    render :edit
    end
  end

  def toggle_disponibilidad
    @product = Product.find(params[:id])
    @product.update(disponible: !@product.disponible)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to dashboard_products_path }
    end
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :nombre,
      :precio,
      :descripcion,
      :imagen,
      :grupo_id,
      :disponible,
      :calificacion,
      ingredientes: [] # ← este permite el array de ingredientes
    )
  end

  def check_admin
    unless current_user.admin? # Verifica si el usuario tiene rol de admin
      redirect_to root_path, alert: "No tienes acceso a esta página."
    end
  end
end
