class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :goods,null: false
      t.text :information,null: false
      t.integer :price,null: false
      t.integer :category_id,null: false
      t.integer :condition_id,null: false
      t.integer :cost_burden_id,null: false
      t.integer :prefectures_id,null: false
      t.integer :aim_id,null: false, foreign_key: true
      t.references :user
      t.timestamps
    end
  end
end
