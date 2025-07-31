class CreateCarritoItems < ActiveRecord::Migration[8.0]
  def change
    create_table :carrito_items do |t|
      t.references :carrito, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :cantidad
      t.integer :precio

      t.timestamps
    end
  end
end
