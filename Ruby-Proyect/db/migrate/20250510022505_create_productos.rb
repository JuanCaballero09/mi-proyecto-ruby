class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.float :precio
      t.string :descripcion
      t.boolean :disponible
      t.string :imagen

      t.timestamps
    end
  end
end
