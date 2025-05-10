class AddGrupoToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :grupo, null: false, foreign_key: true
  end
end
