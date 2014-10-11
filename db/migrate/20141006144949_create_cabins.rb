class CreateCabins < ActiveRecord::Migration
  def change
    create_table :cabins do |t|
      t.string :name, null: false
      t.boolean :available, default: true
      t.text :description
      t.integer :max, default: 0
      t.text :gender, null: false
      t.integer :people_count, default: 0

      t.timestamps
    end
  end
end
