class CreateIngredienteProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :ingrediente_productos do |t|
      t.references :product, null: false, foreign_key: true
      t.references :ingrediente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
