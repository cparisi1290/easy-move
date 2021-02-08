class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.string :name
      
      t.timestamps null: false
    end
  end
end
