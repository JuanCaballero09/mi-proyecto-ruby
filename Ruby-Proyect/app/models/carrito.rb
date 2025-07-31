class Carrito < ApplicationRecord
  has_many :carrito_items, dependent: :destroy
  has_many :products, through: :carrito_items

  before_create :generar_numero_orden

  private

  def generar_numero_orden
    self.numero_orden ||= "CARR-#{SecureRandom.hex(4).upcase}"
  end
end
