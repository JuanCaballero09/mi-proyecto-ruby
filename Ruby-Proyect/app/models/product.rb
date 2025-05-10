class Product < ApplicationRecord
  belongs_to :grupo

  validates :nombre, :descripcion, :precio, presence: true
end
