class AddIngredientesYCalificacionToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :ingredientes, :text, array: true, default: []
    add_column :products, :calificacion, :decimal, precision: 2, scale: 1
  end
end
