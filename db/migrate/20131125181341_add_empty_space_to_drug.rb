class AddEmptySpaceToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :empty_space, :boolean, default: false
  end
end
