class CreateSavedShops < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_shops do |t|
      t.references :user, null: false, foreign_key: true, index:true
      t.references :shop, null: false, foreign_key: true, index:true

      t.timestamps
    end
  end
end
