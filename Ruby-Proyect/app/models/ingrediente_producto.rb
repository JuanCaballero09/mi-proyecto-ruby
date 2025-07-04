class IngredienteProducto < ApplicationRecord
  belongs_to :product
  belongs_to :ingrediente
end
