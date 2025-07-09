class Grupos::ProductsController < ApplicationController
  before_action :set_grupo
  before_action :set_product, only: [:show] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets

  # GET /grupos/:grupo_id/products
  def index
    @products = @grupo.products
  end

  # GET /grupos/:grupo_id/products/:id
  def show
  end

  private

  def set_grupo
    @grupo = Grupo.find(params[:grupo_id])
  end

  def set_product
    @product = @grupo.products.find(params[:id])
  end
end
