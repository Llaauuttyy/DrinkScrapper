class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :plu
      t.string :name
      t.string :category
      t.string :img_link
      t.integer :price
      t.string :size

      t.timestamps
    end
  end
end
