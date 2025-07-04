class Ingrediente < ApplicationRecord
  has_many :ingrediente_productos
  has_many :products, through: :ingrediente_productos
end
