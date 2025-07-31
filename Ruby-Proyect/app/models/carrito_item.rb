class CarritoItem < ApplicationRecord
  belongs_to :carrito
  belongs_to :product

  validates :cantidad, numericality: { greater_than: 0 }
end
