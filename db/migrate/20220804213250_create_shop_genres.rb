class CreateShopGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_genres do |t|
      t.references :shop, null: false, foreign_key: true, index: true
      t.references :genre, null: false, foreign_key: true, index:true

      t.timestamps
    end
  end
end
