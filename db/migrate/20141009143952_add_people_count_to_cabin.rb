class AddPeopleCountToCabin < ActiveRecord::Migration
  def change
    add_column :cabins, :people_count, :integer, default: 0
  end
end
