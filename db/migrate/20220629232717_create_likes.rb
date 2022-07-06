class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :plu
      t.integer :likes
      t.string :category

      t.timestamps
    end
  end
end
