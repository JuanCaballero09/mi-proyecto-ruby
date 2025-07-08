class Grupos::ProductsController < ApplicationController
  before_action :set_grupos_product, only: %i[ show edit update destroy ]

  # GET /grupos/products or /grupos/products.json
  def index
    @grupos_products = Grupo.find(params[:grupo_id]).products
  end

  # GET /grupos/products/1 or /grupos/products/1.json
  def show
    
  end

  # GET /grupos/products/new
  def new
    @grupos_product = Grupos::Product.new
  end

  # GET /grupos/products/1/edit
  def edit
  end

  # POST /grupos/products or /grupos/products.json
  def create
    @grupos_product = Grupos::Product.new(grupos_product_params)

    respond_to do |format|
      if @grupos_product.save
        format.html { redirect_to @grupos_product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @grupos_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grupos_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/products/1 or /grupos/products/1.json
  def update
    respond_to do |format|
      if @grupos_product.update(grupos_product_params)
        format.html { redirect_to @grupos_product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @grupos_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grupos_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/products/1 or /grupos/products/1.json
  def destroy
    @grupos_product.destroy!

    respond_to do |format|
      format.html { redirect_to grupos_products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupos_product
      @grupos_product = Grupos::Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def grupos_product_params
      params.fetch(:grupos_product, {})
    end
end
