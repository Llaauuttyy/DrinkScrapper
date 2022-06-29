class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :plu
      t.string :review
      t.string :reviewer_name

      t.timestamps
    end
  end
end
