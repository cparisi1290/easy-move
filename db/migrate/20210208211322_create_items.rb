class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :box_id
      t.integer :cateogry_id
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end