class Product < ApplicationRecord
  belongs_to :grupo

  has_many :ingrediente_productos, dependent: :destroy
  has_many :ingredientes, through: :ingrediente_productos
  has_many :carrito_items
  has_many :carritos, through: :carrito_items

  validates :nombre, :descripcion, :precio, presence: true

  before_create :asignar_id_menor

  has_one_attached :imagen

  private

  def asignar_id_menor
    # Buscar la menor ID libre
    ids_existentes = Product.pluck(:id).sort
    posible_id = 1

    ids_existentes.each do |id|
      break if id != posible_id
      posible_id += 1
    end

    self.id = posible_id
  end
end
