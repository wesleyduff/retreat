class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :lastname
      t.string :firstname
      t.string :gender
      t.integer :age
      t.integer :cabin_id
      t.integer :role_id

      t.timestamps
    end
  end
end
