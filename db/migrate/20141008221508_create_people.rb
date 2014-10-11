class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.integer :cabin_id
      t.integer :role_id

      t.timestamps
    end
  end
end
