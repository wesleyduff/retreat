class AddGenderToCabins < ActiveRecord::Migration
  def change
    add_column :cabins, :gender, :string
  end
end
