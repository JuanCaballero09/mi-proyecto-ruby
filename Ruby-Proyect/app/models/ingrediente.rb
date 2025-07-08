class Ingrediente < ApplicationRecord
  has_many :ingrediente_productos
  has_many :products, through: :ingrediente_productos

  before_create :asignar_id_menor


  def asignar_id_menor
    # Buscar la menor ID libre
    ids_existentes = Ingrediente.pluck(:id).sort
    posible_id = 1

    ids_existentes.each do |id|
      break if id != posible_id
      posible_id += 1
    end

    self.id = posible_id
  end
end
