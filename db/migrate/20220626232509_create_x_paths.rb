class CreateXPaths < ActiveRecord::Migration[7.0]
  def change
    create_table :x_paths do |t|
      t.string :section
      t.string :attribute
      t.string :xpath

      t.timestamps
    end
  end
end
