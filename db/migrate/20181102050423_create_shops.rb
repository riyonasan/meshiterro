class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops , id: :integer do |t|
      t.string :shop_name
      t.integer :area_id, foreign_key: true
      t.integer :genre_id, foreign_key: true

      t.timestamps
    end
  end
end
