class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title, unique: true, null: false
      t.text :description

      t.timestamps
    end
  end
end
