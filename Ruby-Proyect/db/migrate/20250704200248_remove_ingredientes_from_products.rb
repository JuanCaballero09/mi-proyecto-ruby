class RemoveIngredientesFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :ingredientes, :text
  end
end
