class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :img_link
      t.float :price
      t.float :size

      t.timestamps
    end
  end
end
