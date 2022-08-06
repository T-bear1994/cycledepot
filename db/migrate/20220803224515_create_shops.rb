class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.float :latitude, null:false
      t.float :longitude, null:false
      t.text :business_hour, null:false
      t.boolean :cashless, null:false
      t.boolean :bike_rack, null:false
      t.text :remarks

      t.timestamps
    end
  end
end
