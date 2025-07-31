class CreateCarritos < ActiveRecord::Migration[8.0]
  def change
    create_table :carritos do |t|
      t.string :numero_orden

      t.timestamps
    end
  end
end
