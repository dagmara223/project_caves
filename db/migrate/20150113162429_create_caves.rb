class CreateCaves < ActiveRecord::Migration
  def change
    create_table :caves do |t|
      t.string :name
      t.string :inventory_no
      t.string :length
      t.string :depth
      t.string :denivelation
      t.string :genesis
      t.string :inventory_id
      t.string :x_1992
      t.string :y_1992
      t.string :lat
      t.string :lon

      t.timestamps null: false
    end
  end
end
