class AddFamilesIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :family_id, :integer
  end
end
