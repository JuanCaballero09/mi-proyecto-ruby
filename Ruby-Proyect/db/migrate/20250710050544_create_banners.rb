class CreateBanners < ActiveRecord::Migration[8.0]
  def change
    create_table :banners do |t|
      t.timestamps
    end
  end
end
