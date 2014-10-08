class CreateCabins < ActiveRecord::Migration
  def change
    create_table :cabins do |t|
      t.string :name
      t.boolean :available
      t.text :description
      t.integer :max

      t.timestamps
    end
  end
end
