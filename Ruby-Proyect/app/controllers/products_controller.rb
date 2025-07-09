class ProductsController < ApplicationController
  def index
    @products = Product.includes(:grupo).where(disponible: true).order(:grupo_id, :id)
  end
end
