class CreateUrLs < ActiveRecord::Migration[7.0]
  def change
    create_table :ur_ls do |t|
      t.string :section
      t.string :url

      t.timestamps
    end
  end
end
