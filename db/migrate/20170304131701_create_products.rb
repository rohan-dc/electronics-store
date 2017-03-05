class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :category_id, :null => false, :references => [:product, :id]
      t.string :productID
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
