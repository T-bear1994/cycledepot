class CreateBrowsingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :browsing_histories do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :shop, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
